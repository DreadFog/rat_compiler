open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_identifiants

exception ErreurNonDetectee

(****************************************)
(** Chemin d'accès aux fichiers de test *)
(****************************************)

let pathFichiersRat = "../../../../tests_new/gestion_id/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

(* requires ppx_expect in jbuild, and `opam install ppx_expect` *)

let%expect_test "testprintint" =
  runtam (pathFichiersRat^"testTernaire1.rat");
  [%expect{| 7 |}]