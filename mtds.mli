open Type

(* Définition du type des informations associées aux identifiants *)
type 'a info =
  | InfoConst of string * int (* pas de marqueur pour les constantes *)
  | InfoVar of 'a * typ ref * int ref * string ref (* identifiant x type x déplacement x registre *)
  | InfoFun of ('a * typ * (typ*'a) list) list (* liste de liste pour la surcharge *)
  | InfoBoucle of (string * string) list (* Les étiquettes de début et fin de boucle *)

(* Table des symboles hiérarchique
 * Les tables locales sont codées à l'aide d'une hashtable *)
type ('a,'b) tds

(* unwrap : string -> a Option -> a 
 * Si l'option est vide, lève une erreur. Sinon, unwrap l'option.
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
val unwrap : 'a -> 'b option -> ('a -> string) -> 'b

(* creerTDSMere : unit -> ('a, 'b) tds
 * Création d'une table des symboles à la racine *)
val creerTDSMere : unit -> ('a,'b) tds

(* creerTDSFille : ('a, 'b) tds -> ('a, 'b) tds
 * Création d'une table des symboles fille *)
val creerTDSFille : ('a,'b) tds -> ('a,'b) tds

(* Ajoute une information dans la table des symboles locale *)
val ajouter : ('a,'b) tds -> 'a -> 'b -> unit

(* chercherLocalement : ('a, 'b) tds -> 'a -> 'b option
 * Recherche les informations d'un identificateur dans la tds locale
 * Ne cherche que dans la tds de plus bas niveau *)
val chercherLocalement : ('a,'b) tds -> 'a -> 'b option

(* chercherLocalementUnsafe : ('a -> string) -> ('a, 'b) tds -> 'a -> 'b
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
val chercherLocalementUnsafe : ('a -> string) -> ('a,'b) tds -> 'a -> 'b

(* absentLocalementUnsafe : ('a -> string) -> ('a, 'b) tds -> 'a -> unit
 * Objectif : assurer (assert) de l'absence d'une clé nom
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
val absentLocalementUnsafe : ('a -> string) -> ('a,'b) tds -> 'a -> unit

(* chercherGlobalement : ('a, 'b) tds -> 'a -> 'b option
 * Recherche les informations d'un identificateur dans la tds locale
 * puis les tds mères de celle-ci si ident n'est pas trouvé. *)
val chercherGlobalement : ('a,'b) tds -> 'a -> 'b option

(* chercherGlobalementUnsafe : ('a -> string) -> ('a, 'b) tds -> 'a -> 'b
 * Remarque : fonction unsafe, levée d'erreur et possible affichage *)
val chercherGlobalementUnsafe : ('a -> string) -> ('a,'b) tds -> 'a -> 'b

(* modifier_type_variable : typ -> 'a info -> unit
 * Précondition : Levée d'erreur si l'info donnée n'est pas une info sur une variable 
 * Remarque : fonction inpure, utilisation de pointeur *)
val modifier_type_variable : typ -> 'a info -> unit

(* modifier_adresse_variable : int -> string -> 'a info -> unit
 * Précondition : Levée d'erreur si l'info donnée n'est pas une info sur une variable 
 * Remarque : fonction inpure, utilisation de pointeur *)
val modifier_adresse_variable : int -> string -> 'a info -> unit

(* type_of_info : 'a info -> typ
 * Précondition : Levée d'erreur si l'info est une InfoBoucle *)
val type_of_info : 'a info -> typ

(* ajouter_liste_boucle : 'a info -> string -> string -> 'b info
 * Précondition : Levée d'erreur si l'info n'est pas une info boucle *)
val ajouter_liste_boucle : 'a info -> string -> string -> 'a info

