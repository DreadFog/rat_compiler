open Rat
open Compilateur
open Passe

(* Return la liste des adresses des variables d'un programme RAT *)
let getListeDep ratfile =
  let input = open_in ratfile in
  let filebuf = Lexing.from_channel input in
  try
  let ast = Parser.main Lexer.token filebuf in
  let past = CompilateurRat.calculer_placement ast in
  let listeAdresses = VerifPlacement.analyser past in
  listeAdresses
  with
  | Lexer.Error _ as e ->
      report_error ratfile filebuf "lexical error (unexpected character).";
      raise e
  | Parser.Error as e->
      report_error ratfile filebuf "syntax error.";
      raise e

(* teste si dans le fichier fichier, dans la fonction fonction (main pour programme principal)
la occ occurence de la variable var a l'adresse dep[registre]
*)
let test fichier fonction (var,occ) (dep,registre) = 
  let l = getListeDep fichier in
  let lmain = List.assoc fonction l in
  let rec aux i lmain = 
    if i=1 
    then
      let (d,r) = List.assoc var lmain in
      (d=dep && r=registre)
    else 
      aux (i-1) (List.remove_assoc var lmain)
  in aux occ lmain

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/placement/sans_fonction/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

open Ast
let%test "test1_x" = 
  test (pathFichiersRat^"test1.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0,"SB")

let%test "test2_x" = 
  test (pathFichiersRat^"test2.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0,"SB")

let%test "test2_y" = 
  test (pathFichiersRat^"test2.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",1) (1,"SB")

let%test "test2_z" = 
  test (pathFichiersRat^"test2.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",1)  (2 ,"SB")

let%test "test3_x" = 
  test (pathFichiersRat^"test3.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0, "SB")

let%test "test3_y" = 
  test (pathFichiersRat^"test3.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",1)  (1, "SB")

let%test "test3_z" = 
  test (pathFichiersRat^"test3.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",1)  (2, "SB")

let%test "test4_x" = 
  test (pathFichiersRat^"test4.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0, "SB")
  
let%test "test4_y" = 
  test (pathFichiersRat^"test4.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",1)  (2, "SB")
  
let%test "test4_z" = 
  test (pathFichiersRat^"test4.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",1)  (4, "SB")

let%test "test5_x" = 
  test (pathFichiersRat^"test5.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0, "SB")
  
let%test "test5_y" = 
  test (pathFichiersRat^"test5.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",1)  (1, "SB")
  
let%test "test5_z" = 
  test (pathFichiersRat^"test5.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",1)  (3, "SB")

let%test "test6_x_1" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0, "SB")
  
let%test "test6_y_1" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",1)  (1, "SB")
  
let%test "test6_z_1" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",1)  (3, "SB")

let%test "test6_x_2" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",2)  (4, "SB")
  
let%test "test6_y_2" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",2)  (5, "SB")
  
let%test "test6_z_2" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",2)  (7, "SB")

let%test "test6_x_3" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",3)  (4, "SB")
  
let%test "test6_y_3" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",3)  (5, "SB")
  
let%test "test6_z_3" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",3)  (7, "SB")

let%test "test6_x1" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x1",1)  (4, "SB")
  
let%test "test6_y1" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y1",1)  (5, "SB")
  
let%test "test6_z1" = 
  test (pathFichiersRat^"test6.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z1",1)  (7, "SB")

let%test "test7_x_1" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",1)  (0, "SB")
    
let%test "test7_y_1" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",1)  (1, "SB")
    
let%test "test7_z_1" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",1)  (3, "SB")
  
let%test "test7_x_2" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x",2)  (4, "SB")
    
let%test "test7_y_2" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y",2)  (5, "SB")
    
let%test "test7_z_2" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z",2)  (7, "SB")
  
let%test "test7_x1" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "x1",1)  (4, "SB")
    
let%test "test7_y1" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "y1",1)  (5, "SB")
    
let%test "test7_z1" = 
  test (pathFichiersRat^"test7.rat")  (AstSyntax.Symbole "main") (AstSyntax.Symbole "z1",1)  (7, "SB")
