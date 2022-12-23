open Type
open Hashtbl
open Exceptions_identifiants

(* Définition du type des informations associées aux identifiants *)
type 'a info =
  | InfoConst of string * int (* pas de marqueur pour les constantes *)
  | InfoVar of 'a * typ * int * string
  | InfoFun of 'a * typ * (typ*'a) list
  | InfoBoucle of (string * string) list (* Les étiquettes de début et fin de boucle *)
  (*| InfoParam of string * typ*)

(* Données stockées dans la tds  et dans les AST : pointeur sur une information *)
type 'a info_ast = 'a info ref  

(* Table des symboles hiérarchique *)
(* Les tables locales sont codées à l'aide d'une hashtable *)
type ('a,'b) tds =
  | Nulle
  (* Table courante : la table mère - la table courante *)
  | Courante of ('a,'b) tds * ('a,'b) Hashtbl.t

 (* Créer une information à associer à l'AST à partir d'une info *)
let info_to_info_ast (i : 'a info) = ref i

 (* Récupère l'information associée à un noeud *)
let info_ast_to_info (i : 'a info_ast) = !i

(* unwrap : string -> a Option -> a 
  * Paramètre s : l'identifiant qu'on essaie de unwrap
  * Paramètre aOpt : une option d'info associé à s
  * Si l'option est vide, lève une erreur. Sinon, unwrap l'option.
  *)
let unwrap s aOpt print_err = match aOpt with
  None -> raise (IdentifiantNonDeclare (print_err s)) 
  |Some a -> a

(* Création d'une table des symboles à la racine *)
let creerTDSMere () = Courante (Nulle, create 100)

(* Création d'une table des symboles fille *)
(* Le paramètre est la table mère *)
let creerTDSFille mere = Courante (mere, create 100)

(* Ajoute une information dans la table des symboles locale *)
(* tds : la tds courante *)
(* string : l'identifiant *)
(* info : l'information à associer à l'identificateur *)
(* Si l'identificateur est déjà présent dans TDS, l'information est écrasée *)
(* retour : unit *)
let ajouter tds ident info =
match tds with
| Nulle -> failwith "Ajout dans une table vide"
| Courante (_,c) -> add c ident info

(* Recherche les informations d'un identificateur dans la tds locale *)
(* Ne cherche que dans la tds de plus bas niveau *)
let chercherLocalement tds ident =
match tds with
| Nulle -> None
| Courante (_,c) -> find_opt c ident 

(* Prend une fonction pour print les identifiants print_err *)
let chercherLocalementUnsafe print_err tds ident = unwrap ident (chercherLocalement tds ident) print_err

let absentLocalementUnsafe print_err tds nom =
  match chercherLocalement tds nom with
  |None -> ()
  |Some _ -> raise (Exceptions_identifiants.DoubleDeclaration (print_err nom))

let rec chercherGlobalement tds nom =
  match tds with
  | Nulle -> None
  | Courante (m,c) ->
    match Hashtbl.find_opt c nom with
      | Some _ as i -> i
      | None -> chercherGlobalement m nom

let chercherGlobalementUnsafe print_err tds nom = unwrap nom (chercherGlobalement tds nom) print_err

let modifier_type_variable t i =
match !i with
| InfoVar (n,_,dep,base) -> i:= InfoVar (n,t,dep,base)
| _ -> failwith "Appel modifier_type_variable pas sur un InfoVar"

let modifier_type_fonction t tp i =
match !i with
| InfoFun(n,_,_) -> i:= InfoFun(n,t,tp)
| _ -> failwith "Appel modifier_type_fonction pas sur un InfoFun"

let modifier_adresse_variable d b i =
match !i with
|InfoVar (n,t,_,_) -> i:= InfoVar (n,t,d,b)
| _ -> failwith "Appel modifier_adresse_variable pas sur un InfoVar"

let type_of_info_ast iast =
  match info_ast_to_info iast with
    |InfoConst(_,_) -> Int
    |InfoVar(_,t,_,_) -> t
    |InfoFun(_,t,_) -> t
    |InfoBoucle(_) -> raise Exceptions_identifiants.ErreurInterne

(* Ajouter à une infoboucle un nouvel élément *)
let ajouter_liste_boucle i e1 e2 =
  match !i with 
  | InfoBoucle liste -> i:=InfoBoucle((e1,e2)::liste)
  | _ -> failwith "Appel modifier_liste_boucle sur autre chose qu'une boucle"

(* Inverser la liste d'une infoboucle
   Utilité: lors de la génération de code, nécessité de parcourir celle_ci en sens inverse *)
let inverser_liste_boucle i =
  match !i with 
  | InfoBoucle liste -> i:=InfoBoucle(List.rev liste)
  | _ -> failwith "Appel modifier_liste_boucle sur autre chose qu'une boucle"

(* Supprimer le premier élément d'une liste d'infoboucle 
   Utilité: Dans le cas où plusieures boucles auraient le même nom, la boucle suivante sera associée aux labels
   présents en tête de boucle. D'où la nécessité de supprimer ceux actuels après utilisation lors de la génération
   de code.*)
let supprimer_premier_liste_boucle i =
  match !i with 
  | InfoBoucle liste -> i:=InfoBoucle(List.tl liste)
  | _ -> failwith "Appel modifier_liste_boucle sur autre chose qu'une boucle"

(* Test pour éviter les warnings *)
let%test _ = 
let _ = creerTDSMere in
let _ = info_to_info_ast in
let _ = creerTDSFille in
let _ = absentLocalementUnsafe in
let _ = chercherLocalementUnsafe in
let _ = chercherGlobalementUnsafe in
let _ = modifier_adresse_variable in
let _ = modifier_type_fonction in
let _ = modifier_type_variable in
let _ = type_of_info_ast in
let _ = chercherLocalement in
let _ = ajouter_liste_boucle in
let _ = inverser_liste_boucle in
let _ = supprimer_premier_liste_boucle in true