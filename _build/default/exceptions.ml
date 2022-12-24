open Type
open Ast.AstSyntax

exception ErreurInterne

(* Exceptions pour le typage *)
(* Le premier type est le type réel, le second est le type attendu *)
exception TypeInattendu of typ * typ
exception TypesParametresInattendus of typ list * typ list
exception TypeBinaireInattendu of binaire * typ * typ (* les types sont les types réels non compatible avec les signatures connues de l'opérateur *)

(* Utilisation illégale de return dans le programme principal 
exception RetourDansMain *)
let string_of_binaire = function
  | Plus -> "+"
  | Mult -> "*"
  | Inf -> "<"
  | Fraction -> "/"
  | Equ -> "="


(* Fonction qui affiche une erreur *)
let afficher_erreur exn (numero_ligne, contexte) = 
  let msg = match exn with
    | ErreurInterne -> "Erreur interne"
    | TypeInattendu (t1, t2) -> "Type inattendu : " ^ (string_of_type t1) ^ " au lieu de " ^ (string_of_type t2)
    | TypesParametresInattendus (t1, t2) -> let fold_right_fun = fun c p -> (string_of_type c) ^ p in
      "Types de paramètres inattendus : " ^ (List.fold_right fold_right_fun t1 "") ^ " au lieu de " ^ (List.fold_right fold_right_fun t2 "")
    | TypeBinaireInattendu (b, t1, t2) -> "Type inattendu pour l'opérateur " ^ (string_of_binaire b) ^ " : " ^ (string_of_type t1) ^ " et " ^ (string_of_type t2)
    (*| RetourDansMain -> "Retour dans le programme principal"*)
    | _ -> "Erreur inconnue au niveau du handler d'erreurs"
  in
  print_endline ("Erreur à la ligne " ^ (string_of_int numero_ligne) ^ " : " ^ msg);
  print_endline ("Contexte : " ^ contexte)

(* Fonction qui renvoie le type d'une expression *)
