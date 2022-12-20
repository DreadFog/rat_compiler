open Type
open Ast.AstSyntax

exception ErreurInterne
exception MarqueurInattendu

(* Exceptions pour le typage *)
(* Le premier type est le type réel, le second est le type attendu *)
exception TypeInattendu of typ * typ
exception TypesParametresInattendus of typ list * typ list
exception TypeBinaireInattendu of binaire * typ * typ (* les types sont les types réels non compatible avec les signatures connues de l'opérateur *)

(* Utilisation illégale de return dans le programme principal 
exception RetourDansMain *)
