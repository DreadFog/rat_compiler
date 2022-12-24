open Type

(* Type pour le contexte *)
type contexte = int * (string * int) list (* le numéro de ligne et les bloc dans lesquels l'instruction est *)

(* Interface des arbres abstraits *)
module type Ast =
sig
   type identifiant
   type expression
   type instruction
   type fonction
   type programme
end


(* *************************************** *)
(* AST après la phase d'analyse syntaxique *)
(* *************************************** *)
module AstSyntax =
struct

(* Rq : question cruciale : est-ce que int *a c'est ( int * ) a ou int ( *a ) ? 
        choix : int ( *a ), on traite ( *a )
        comme l'indentifiant, constitué d'un marqueur : Ident ou Pointeur
        -> On autorise les fonctions d'ordre supérieur avec les pointeurs mais
        attention a gérer le LB !!
        Par contre, on autorise pas les pointeurs dans les paramètres, faudra voir pour les typedef struct
*)

type identifiant = string * Type.mark

(* Opérateurs unaires de Rat *)
type unaire = Numerateur | Denominateur

(* Opérateurs binaires de Rat *)
type binaire = Fraction | Plus | Mult | Equ | Inf

(* Expressions de Rat *)
type expression =
  (* Appel de fonction représenté par le nom de la fonction et la liste des paramètres réels *)
  | AppelFonction of identifiant * expression list
  (* Accès à un identifiant représenté par son nom
  | Ident of string *)
  (* Booléen *)
  | Booleen of bool
  (* Entier *)
  | Entier of int
  (* Adresse d'une variable *)
  | Adr of identifiant
  (* Nouveau pointeur *)
  | New of (Type.typ * Type.mark)
  | NULL
  (* Référence *)
  | Identifiant of identifiant
  (* Opération unaire représentée par l'opérateur et l'opérande *)
  | Unaire of unaire * expression
  (* Opération binaire représentée par l'opérateur, l'opérande gauche et l'opérande droite *)
  | Binaire of binaire * expression * expression
  (* Expression ternaire de la forme e1?e2:e3 *)
  | Ternaire of expression * expression * expression
  
(* Instructions de Rat *)
type bloc = instruction list
and instruction =
  (* Déclaration de variable représentée par son type, son nom et l'expression d'initialisation *)
  (* | Declaration of typ * string * expression *)
  | Declaration of typ * identifiant * expression
  (* Affectation d'une variable représentée par son nom et la nouvelle valeur affectée *)
  | Affectation of identifiant * expression 
  (* Déclaration d'une constante représentée par son nom et sa valeur (entier) *)
  | Constante of identifiant * int
  (* Affichage d'une expression *)
  | Affichage of expression
  (* Conditionnelle représentée par la condition, le bloc then et le bloc else *)
  | Conditionnelle of expression * bloc * bloc
  (*Boucle TantQue représentée par la conditin d'arrêt de la boucle et le bloc d'instructions *)
  | TantQue of expression * bloc
  (* return d'une fonction *)
  | Retour of expression
  (* Instructions de boucles *)
  | Boucle of string option * bloc
  | Break of string option
  | Continue of string option

(* Structure des fonctions de Rat *)
(* type de retour - nom - liste des paramètres (association type et nom) - corps de la fonction *)
type fonction = Fonction of typ * identifiant * (typ * identifiant) list * bloc

(* Structure d'un programme Rat *)
(* liste de fonction - programme principal *)
type programme = Programme of fonction list * bloc

end


(* ********************************************* *)
(* AST après la phase d'analyse des identifiants *)
(* ********************************************* *)
module AstTds =
struct
  type tds_info_ast = (AstSyntax.identifiant) Mtds.info

  type identifiant = tds_info_ast

  (* Opérateurs unaires de Rat *)

  (* Expressions existantes dans notre langage *)
  (* ~ expression de l'AST syntaxique où les noms des identifiants ont été
  remplacés par les informations associées aux identificateurs *)
  type expression =
    | AppelFonction of identifiant * expression list
    (*| Ident of Tds.info_ast  -- le nom de l'identifiant est remplacé par ses informations *)
    | Booleen of bool
    | Entier of int
    (* mark pour les cas int ** a = ...; ...; b = &( *a ); *)
    | Adr of identifiant
    | New of (Type.typ * Type.mark)
    | NULL
    (* 
       * la marque est la diff entre celle initiale et affectée
       * ex : int ***a = ...; int **b = *a; alors
       * l'identifiant correspondant à *a a une mark de 
       * Pointeur(Pointeur(Neant)) ie ** *)
    | Identifiant of identifiant
    | Unaire of AstSyntax.unaire * expression
    | Binaire of AstSyntax.binaire * expression * expression
    | Ternaire of expression * expression * expression

  (* instructions existantes dans notre langage *)
  (* ~ instruction de l'AST syntaxique où les noms des identifiants ont été
  remplacés par les informations associées aux identificateurs
  + suppression de nœuds (const) *)
  type bloc = (instruction * contexte) list
  and instruction =
      (* le nom de l'identifiant est remplacé par ses informations : *)
    | Declaration of typ * identifiant * expression 
      (* le nom de l'identifiant est remplacé par ses informations
       * la marque est la diff entre celle initiale et affectée
       * ex : int ***a = ...; *a = ...; alors l'affectation correspondant
       * à *a est Pointeur(Pointeur(Neant)) ie ** *)
    | Affectation of identifiant * expression 
    | Affichage of expression
    | Conditionnelle of expression * bloc * bloc
    | TantQue of expression * bloc
      (* les informations sur la fonction à laquelle est associé le retour : *)
    | Retour of expression * identifiant
      (* les nœuds ayant disparus: Const : *)
    | Empty 
    (* Instructions de boucles *)
    | Boucle of identifiant * bloc
    | Break of string
    | Continue of string


  (* Structure des fonctions dans notre langage *)
  (* type de retour - informations associées à l'identificateur (dont son nom) - liste des paramètres (association type et information sur les paramètres) - corps de la fonction *)
  type fonction = Fonction of typ * tds_info_ast * (typ ref * tds_info_ast ) list * bloc

  (* Structure d'un programme dans notre langage *)
  type programme = Programme of fonction list * bloc

end


(* ******************************* *)
(* AST après la phase de typage *)
(* ******************************* *)
module AstType =
struct
type type_info_ast = AstTds.tds_info_ast

type identifiant = AstTds.identifiant

(* Opérateurs unaires de Rat - résolution de la surcharge *)
type unaire = Numerateur | Denominateur

(* Opérateurs binaires existants dans Rat - résolution de la surcharge *)
type binaire = Fraction | PlusInt | PlusRat | MultInt | MultRat | EquInt | EquBool | Inf

(* Expressions existantes dans Rat *)
(* = expression de AstTds *)
type expression =
  | AppelFonction of identifiant * expression list
  (* | Ident of Tds.info_ast *)
  | Booleen of bool
  | Entier of int 
  | Unaire of unaire * expression
  | Binaire of binaire * expression * expression
  | Adr of identifiant
  | New of (Type.typ * Type.mark)
  | NULL
  | Identifiant of identifiant
  | Ternaire of expression * expression * expression

(* instructions existantes Rat *)
(* = instruction de AstTds + informations associées aux identificateurs, mises à jour *)
(* + résolution de la surcharge de l'affichage *)
type bloc = (instruction * contexte) list
 and instruction =
  | Declaration of type_info_ast * expression
  | Affectation of type_info_ast * expression
  | AffichageInt of expression
  | AffichageRat of expression
  | AffichageBool of expression
  | Conditionnelle of expression * bloc * bloc
  | TantQue of expression * bloc
  | Retour of expression * type_info_ast
  | Empty (* les nœuds ayant disparus: Const *)
  (*Instructions de boucles *)
  | Boucle of identifiant * bloc
  | Break of string
  | Continue of string

(* informations associées à l'identificateur (dont son nom), liste des paramètres, corps *)
type fonction = Fonction of type_info_ast * type_info_ast list * bloc

(* Structure d'un programme dans notre langage *)
type programme = Programme of fonction list * bloc

end

(* ******************************* *)
(* AST après la phase de placement *)
(* ******************************* *)
module AstPlacement =
struct
type placement_info_ast = AstTds.tds_info_ast

(* Expressions existantes dans notre langage *)
(* = expression de AstType  *)
type expression = AstType.expression
type identifiant = AstTds.identifiant

(* instructions existantes dans notre langage *)
type bloc = (instruction * contexte) list * int (* taille du bloc *)
 and instruction =
 | Declaration of placement_info_ast * expression
 | Affectation of placement_info_ast * expression
 | AffichageInt of expression
 | AffichageRat of expression
 | AffichageBool of expression
 | Conditionnelle of expression * bloc * bloc
 | TantQue of expression * bloc
 | Retour of expression * int * int (* taille du retour et taille des paramètres *)
 | Empty (* les nœuds ayant disparus: Const *)
 (* Instructions de boucles *)
| Boucle of identifiant * bloc
| Break of string
| Continue of string

(* informations associées à l'identificateur (dont son nom), liste de paramètres, corps, expression de retour *)
(* Plus besoin de la liste des paramètres mais on la garde pour les tests du placements mémoire *)
type fonction = Fonction of placement_info_ast * placement_info_ast list * bloc

(* Structure d'un programme dans notre langage *)
type programme = Programme of fonction list * bloc

end
