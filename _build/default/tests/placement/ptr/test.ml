open Rat
open Compilateur
open Passe
open Type

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

let pathFichiersRat = "./fichiersRat/"

(**********)
(*  TESTS *)
(**********)
(* Remarque : dans notre TDS, a la déclaration de int **px; seul px est mis en clé mais pour le test les
   identifiants de la déclarations sont utilisés : nom de la variable + marqueur. *)
let%test "test1_px" = 
  test (pathFichiersRat^"test.rat")  ("main", Neant) (("px", Pointeur(Pointeur(Neant))), 1) (ref 0, ref "SB")
let%test "test1_a" = 
  test (pathFichiersRat^"test.rat")  ("main", Neant) (("a", Neant), 1) (ref 1, ref "SB")
let%test "test1_x" = 
  test (pathFichiersRat^"test.rat")  ("main", Neant) (("x", Neant), 1) (ref 2, ref "SB")
let%test "test1_y" = 
  test (pathFichiersRat^"test.rat")  ("main", Neant) (("y", Neant), 1) (ref 3, ref "SB")