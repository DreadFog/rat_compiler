open Rat
open Compilateur

exception ErreurNonDetectee

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../../tests/gestion_id/avec_surcharge_fct/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "test" = 
  let _ = compiler (pathFichiersRat^"test.rat") in ()