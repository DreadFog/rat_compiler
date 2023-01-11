open Type
open Hashtbl
open Exceptions_non_parametrees

(* Définition du type des informations associées aux identifiants *)
type 'a info =
  | InfoConst of string * int (* pas de marqueur pour les constantes *)
  | InfoVar of 'a * typ ref * int ref * string ref (* identifiant x type x déplacement x registre *)
  | InfoFun of ('a * typ * (typ*'a) list) list (* liste de liste pour la surcharge *)
  | InfoBoucle of (string * string) list (* Les étiquettes de début et fin de boucle *)

(* Table des symboles hiérarchique
 * Les tables locales sont codées à l'aide d'une hashtable *)
type ('a,'b) tds =
  | Nulle
  (* Table courante : la table mère - la table courante *)
  | Courante of ('a,'b) tds * ('a,'b) Hashtbl.t

(* unwrap : string -> a Option -> a 
 * Paramètres : s l'identifiant qu'on essaie de unwrap
 *              aOpt une option d'info associé à s
 * Exceptions : Si l'option est vide, lève une erreur. Sinon, unwrap l'option.
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
let unwrap s aOpt print_err = match aOpt with
  None -> raise (IdentifiantNonDeclare (print_err s)) 
  |Some a -> a

(* creerTDSMere : unit -> ('a, 'b) tds
 * Création d'une table des symboles à la racine *)
let creerTDSMere () = Courante (Nulle, create 100)

(* creerTDSFille : ('a, 'b) tds -> ('a, 'b) tds
 * Création d'une table des symboles fille
 * Le paramètre est la table mère *)
let creerTDSFille mere = Courante (mere, create 100)

(* Ajoute une information dans la table des symboles locale
 * tds : la tds courante
 * string : l'identifiant
 * info : l'information à associer à l'identificateur
 * Si l'identificateur est déjà présent dans TDS, l'information est écrasée
 * retour : unit *)
let ajouter tds ident info =
  match tds with
    | Nulle -> failwith "Ajout dans une table vide"
    | Courante (_,c) -> add c ident info

(* chercherLocalement : ('a, 'b) tds -> 'a -> 'b option
 * Paramètre : tds dans laquelle il faut chercher
 *             ident, la clé de ce que l'on cherche
 * Recherche les informations d'un identificateur dans la tds locale
 * Ne cherche que dans la tds de plus bas niveau *)
let chercherLocalement tds ident =
  match tds with
    | Nulle -> None
    | Courante (_,c) -> find_opt c ident 

(* chercherLocalementUnsafe : ('a -> string) -> ('a, 'b) tds -> 'a -> 'b
 * Paramètres : print_err permet d'afficher une erreur particulière sur l'identifiant
 *              tds la tds locale
 *              ident l'indentifiant clé
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
let chercherLocalementUnsafe print_err tds ident = unwrap ident (chercherLocalement tds ident) print_err

(* absentLocalementUnsafe : ('a -> string) -> ('a, 'b) tds -> 'a -> unit
 * Paramètres : print_err permet d'afficher une erreur particulière sur l'identifiant
 *              tds la tds locale
 *              nom l'indentifiant clé
 * Objectif : assurer (assert) de l'absence d'une clé nom
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
let absentLocalementUnsafe print_err tds nom =
  match chercherLocalement tds nom with
    |None -> ()
    |Some _ -> raise (DoubleDeclaration (print_err nom))


(* chercherGlobalement : ('a, 'b) tds -> 'a -> 'b option
 * Paramètre : tds dans laquelle il faut chercher
 *             ident, la clé de ce que l'on cherche
 * Recherche les informations d'un identificateur dans la tds locale
 * puis les tds mères de celle-ci si ident n'est pas trouvé. *)
let rec chercherGlobalement tds nom =
  match tds with
  | Nulle -> None
  | Courante (m,c) ->
    match Hashtbl.find_opt c nom with
      | Some _ as i -> i
      | None -> chercherGlobalement m nom

(* chercherGlobalementUnsafe : ('a -> string) -> ('a, 'b) tds -> 'a -> 'b
 * Paramètres : print_err permet d'afficher une erreur particulière sur l'identifiant
 *              tds la tds locale
 *              ident l'indentifiant clé
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
let chercherGlobalementUnsafe print_err tds nom = unwrap nom (chercherGlobalement tds nom) print_err

(* modifier_type_variable : typ -> 'a info -> unit
 * Paramètres : t le type par lequel il faut changer celui actuel
 *              i l'info a modifié
 * Précondition : Levée d'erreur si l'info n'est pas une info sur une variable 
 * Remarque : fonction inpure, utilisation de pointeur *)
let modifier_type_variable t i =
  match i with
  |InfoVar (_,tv,_,_) -> tv := t;
  | _ -> failwith "Appel modifier_adresse_variable pas sur un InfoVar"

(* modifier_adresse_variable : int -> string -> 'a info -> unit
 * Paramètres : d le nouveau déplacement
 *              b le nouveau registre
 *              i l'info a modifié
 * Précondition : Levée d'erreur si l'info n'est pas une info sur une variable 
 * Remarque : fonction inpure, utilisation de pointeur *)
let modifier_adresse_variable d b i =
match i with
|InfoVar (_,_,dv,bv) -> bv := b; dv := d;
| _ -> failwith "Appel modifier_adresse_variable pas sur un InfoVar"

(* type_of_info : 'a info -> typ
 * Paramètre : iast l'info dont il faut extraire le type
 * retour : le type associé à l'info
 * Précondition : Levée d'erreur si l'info est une InfoBoucle *)
let type_of_info iast =
  match iast with
    |InfoConst(_,_) -> Int
    |InfoVar(_,t,_,_) -> !t
    |InfoFun([_,t,_]) -> t
    |_ -> raise ErreurInterne

(* ajouter_liste_boucle : 'a info -> string -> string -> 'b info
 * Paramètres : i l'info (boucle) dont il faut ajouter e1 et e2
 *              e1 : le label de début de boucle
 *              e2 : le label de fin de boucle
 * retour : infoboucle où e1 et e2 ont été ajouté
 * Précondition : Levée d'erreur si l'info n'est pas une info boucle *)
let ajouter_liste_boucle i e1 e2 =
  match i with 
  | InfoBoucle liste -> InfoBoucle ((e1,e2)::liste)
  | _ -> failwith "Appel modifier_liste_boucle sur autre chose qu'une boucle"

(* Test pour éviter les warnings
 * Tous les tests unitaires sont réalisés dans Utests/mtds_tests.ml *)
let%test _ = 
let _ = creerTDSMere in
let _ = creerTDSFille in
let _ = absentLocalementUnsafe in
let _ = chercherLocalementUnsafe in
let _ = chercherGlobalementUnsafe in
let _ = modifier_adresse_variable in
let _ = type_of_info in
let _ = chercherLocalement in
let _ = ajouter_liste_boucle in true

