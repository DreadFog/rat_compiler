open Type

(* Définition du type des informations associées aux identifiants *)
type 'a info =
  | InfoConst of string * int (* pas de marqueur pour les constantes *)
  | InfoVar of 'a * typ ref * int ref * string ref
  | InfoFun of 'a * typ * (typ ref*'a) list
  | InfoBoucle of ((string * string) list) ref

(* Table des symboles hiérarchique *)
(* Les tables locales sont codées à l'aide d'une hashtable *)
type ('a,'b) tds

(* unwrap : string -> a Option -> a 
  * Paramètre s : l'identifiant qu'on essaie de unwrap
  * Paramètre aOpt : une option d'info associé à s
  * Si l'option est vide, lève une erreur. Sinon, unwrap l'option.
  *)
val unwrap : 'a -> 'b option -> ('a -> string) -> 'b

(* Création d'une table des symboles à la racine *)
val creerTDSMere : unit -> ('a,'b) tds

(* Création d'une table des symboles fille *)
(* Le paramètre est la table mère *)
val creerTDSFille : ('a,'b) tds -> ('a,'b) tds

(* Ajoute une information dans la table des symboles locale *)
(* tds : la tds courante *)
(* string : l'identifiant *)
(* info : l'information à associer à l'identificateur *)
(* Si l'identificateur est déjà présent dans TDS, l'information est écrasée *)
(* retour : unit *)
val ajouter : ('a,'b) tds -> 'a -> 'b -> unit

(* Recherche les informations d'un identificateur dans la tds locale *)
(* Ne cherche que dans la tds de plus bas niveau *)
val chercherLocalement : ('a,'b) tds -> 'a -> 'b option

(* Prend une fonction pour print les identifiants print_err *)
val chercherLocalementUnsafe : ('a -> string) -> ('a,'b) tds -> 'a -> 'b

val absentLocalementUnsafe : ('a -> string) -> ('a,'b) tds -> 'a -> unit

val chercherGlobalement : ('a,'b) tds -> 'a -> 'b option

val chercherGlobalementUnsafe : ('a -> string) -> ('a,'b) tds -> 'a -> 'b

val modifier_type_variable : typ -> 'a info -> unit
  
val modifier_adresse_variable : int -> string -> 'a info -> unit

val type_of_info_ast : 'a info -> typ

(* Ajouter à une infoboucle un nouvel élément *)
val ajouter_liste_boucle : 'a info -> string -> string -> unit

(* Inverser la liste d'une infoboucle
   Utilité: lors de la génération de code, nécessité de parcourir celle_ci en sens inverse *)
val inverser_liste_boucle : 'a info -> unit

(* Supprimer le premier élément d'une liste d'infoboucle 
   Utilité: Dans le cas où plusieures boucles auraient le même nom, la boucle suivante sera associée aux labels
   présents en tête de boucle. D'où la nécessité de supprimer ceux actuels après utilisation lors de la génération
   de code.*)
val supprimer_premier_liste_boucle : 'a info -> unit
