(* Utilisation illégale de return dans le programme principal 
exception RetourDansMain *)
open Type
open Ast.AstSyntax

exception ErreurInterne
exception MarqueurInattendu

(* Exceptions pour le typage *)
(* Le premier type est le type réel, le second est le type attendu *)
exception TypeInattendu of (typ * mark) * (typ * mark)
exception TypesParametresInattendus of (typ * mark) list * (typ * mark) list
(* les types sont les types réels non compatible avec les signatures connues de l'opérateur *)
exception TypeBinaireInattendu of binaire * (typ * mark) * (typ * mark)


(* Utilisation illégale de return dans le programme principal 
exception RetourDansMain *)
let string_of_binaire = function
  | Plus -> "+"
  | Mult -> "*"
  | Inf -> "<"
  | Fraction -> "/"
  | Equ -> "="


(*
  Fonction affichant une backtrace pour localiser l'erreur dans le code original
  afficher_contexte: string*int list -> string
*)
let afficher_contexte(contexte) = List.fold_right (fun (nom, ligne) s -> s ^ "\nInstruction " ^ (string_of_int ligne) ^ " : " ^ nom ) contexte ""
(*
  Fonction affichant un erreur de compilation de manière conviviale à l'utilisateur
  afficher_erreur: exn -> int * (string*int) list -> unit
*)
let afficher_erreur exn ((numero_ligne, contexte)) = 
  print_endline("===== ERROR =====");
  let msg = match exn with
    | ErreurInterne -> "Erreur interne"
    | TypeInattendu (t1, t2) ->
        "Type inattendu : "
      ^ (string_of_type_mark t1) ^ " au lieu de " ^ (string_of_type_mark t2)
    | TypesParametresInattendus (t1, t2) ->
      let fold_right_fun = fun c p -> (string_of_type_mark c) ^ p in
      "Types de paramètres inattendus : "
      ^ (List.fold_right fold_right_fun t1 "") ^ " au lieu de " ^ (List.fold_right fold_right_fun t2 "")
    | TypeBinaireInattendu (b, t1, t2) ->
      "Type inattendu pour l'opérateur " ^ (string_of_binaire b) ^ " : "
      ^ (string_of_type_mark t1) ^ " et " ^ (string_of_type_mark t2)
    (*| RetourDansMain -> "Retour dans le programme principal"*)
    | _ -> "Erreur inconnue au niveau du handler d'erreurs"
  in
  print_endline ("Contexte :" ^ (afficher_contexte contexte));
  print_endline ("Erreur instruction " ^ (string_of_int numero_ligne) ^ "\n" ^ msg );
  print_endline ("===== END ERROR =====");
  (*print_endline ("Contexte : " ^ contexte);*)
  raise exn
