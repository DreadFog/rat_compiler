open Rat
open PasseTdsRat
open Compilateur
(*open Exceptions*)
open Exceptions_identifiants

exception ErreurNonDetectee
let pathFichiersRat = "../Utests/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testTernaireSimpleOk" = 
  let _ = compiler (pathFichiersRat^"testTernaireSimpleOk.rat") in () (* ne doit pas lever d'erreur *)
let%test_unit "testVariablePlusPlus" = 
  let _ = compiler (pathFichiersRat^"testVariablePlusPlus.rat") in () (* ne doit pas lever d'erreur *)

(* let%test_unit "testAffectation2"= 
  try 
    let _ = compiler (pathFichiersRat^"testAffectation2.rat") 
    in raise ErreurNonDetectee
  with
  | IdentifiantNonDeclare("y") -> () *)