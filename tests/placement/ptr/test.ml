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

let pathFichiersRat = "../../../../../tests/placement/ptr/fichiersRat/"

(**********)
(*  TESTS *)
(**********)
let%test "test1_px" = 
  test (pathFichiersRat^"test.rat") "main" ("px", 1) ( 0,  "SB")

let%test "test1_a" = 
  test (pathFichiersRat^"test.rat") "main" ("a", 1) ( 1,  "SB")

let%test "test1_x" = 
  test (pathFichiersRat^"test.rat") "main" ("x", 1) ( 2,  "SB")

let%test "test1_y" = 
  test (pathFichiersRat^"test.rat") "main" ("y", 1) ( 3,  "SB")