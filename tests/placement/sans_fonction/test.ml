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


let%test "test1_x" = 
  test (pathFichiersRat^"test1.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0,ref "SB")

let%test "test2_x" = 
  test (pathFichiersRat^"test2.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0,ref "SB")

let%test "test2_y" = 
  test (pathFichiersRat^"test2.rat")  ("main", Type.Neant) (("y", Type.Neant),1) (ref 1,ref "SB")

let%test "test2_z" = 
  test (pathFichiersRat^"test2.rat")  ("main", Type.Neant) (("z", Type.Neant),1)  (ref 2 ,ref "SB")

let%test "test3_x" = 
  test (pathFichiersRat^"test3.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0, ref "SB")

let%test "test3_y" = 
  test (pathFichiersRat^"test3.rat")  ("main", Type.Neant) (("y", Type.Neant),1)  (ref 1, ref "SB")

let%test "test3_z" = 
  test (pathFichiersRat^"test3.rat")  ("main", Type.Neant) (("z", Type.Neant),1)  (ref 2, ref "SB")

let%test "test4_x" = 
  test (pathFichiersRat^"test4.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0, ref "SB")
  
let%test "test4_y" = 
  test (pathFichiersRat^"test4.rat")  ("main", Type.Neant) (("y", Type.Neant),1)  (ref 2, ref "SB")
  
let%test "test4_z" = 
  test (pathFichiersRat^"test4.rat")  ("main", Type.Neant) (("z", Type.Neant),1)  (ref 4, ref "SB")

let%test "test5_x" = 
  test (pathFichiersRat^"test5.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0, ref "SB")
  
let%test "test5_y" = 
  test (pathFichiersRat^"test5.rat")  ("main", Type.Neant) (("y", Type.Neant),1)  (ref 1, ref "SB")
  
let%test "test5_z" = 
  test (pathFichiersRat^"test5.rat")  ("main", Type.Neant) (("z", Type.Neant),1)  (ref 3, ref "SB")

let%test "test6_x_1" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0, ref "SB")
  
let%test "test6_y_1" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("y", Type.Neant),1)  (ref 1, ref "SB")
  
let%test "test6_z_1" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("z", Type.Neant),1)  (ref 3, ref "SB")

let%test "test6_x_2" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("x", Type.Neant),2)  (ref 4, ref "SB")
  
let%test "test6_y_2" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("y", Type.Neant),2)  (ref 5, ref "SB")
  
let%test "test6_z_2" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("z", Type.Neant),2)  (ref 7, ref "SB")

let%test "test6_x_3" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("x", Type.Neant),3)  (ref 4, ref "SB")
  
let%test "test6_y_3" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("y", Type.Neant),3)  (ref 5, ref "SB")
  
let%test "test6_z_3" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("z", Type.Neant),3)  (ref 7, ref "SB")

let%test "test6_x1" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("x1", Type.Neant),1)  (ref 4, ref "SB")
  
let%test "test6_y1" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("y1", Type.Neant),1)  (ref 5, ref "SB")
  
let%test "test6_z1" = 
  test (pathFichiersRat^"test6.rat")  ("main", Type.Neant) (("z1", Type.Neant),1)  (ref 7, ref "SB")

let%test "test7_x_1" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("x", Type.Neant),1)  (ref 0, ref "SB")
    
let%test "test7_y_1" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("y", Type.Neant),1)  (ref 1, ref "SB")
    
let%test "test7_z_1" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("z", Type.Neant),1)  (ref 3, ref "SB")
  
let%test "test7_x_2" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("x", Type.Neant),2)  (ref 4, ref "SB")
    
let%test "test7_y_2" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("y", Type.Neant),2)  (ref 5, ref "SB")
    
let%test "test7_z_2" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("z", Type.Neant),2)  (ref 7, ref "SB")
  
let%test "test7_x1" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("x1", Type.Neant),1)  (ref 4, ref "SB")
    
let%test "test7_y1" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("y1", Type.Neant),1)  (ref 5, ref "SB")
    
let%test "test7_z1" = 
  test (pathFichiersRat^"test7.rat")  ("main", Type.Neant) (("z1", Type.Neant),1)  (ref 7, ref "SB")
