open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_identifiants

exception ErreurNonDetectee
let pathFichiersRat = "./fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testAffectationIncrementee1"= 
    let _ = compiler (pathFichiersRat^"testAffectationIncrementee1.rat") in ()
let%test_unit "testAffectationIncrementee2"= 
  let _ = compiler (pathFichiersRat^"testAffectationIncrementee2.rat") in ()
let%test_unit "testBoucle"= 
  let _ = compiler (pathFichiersRat^"testBoucle.rat") in ()
let%test_unit "testBoucleComplique"= 
  let _ = compiler (pathFichiersRat^"testBoucleComplique.rat") in ()
let%test_unit "testIfSansElse1"= 
  let _ = compiler (pathFichiersRat^"testIfSansElse1.rat") in ()
let%test_unit "testTernaireConditionKo1"=
  try
    let _ = compiler (pathFichiersRat^"testTernaireConditionKo1.rat")
    in raise ErreurNonDetectee
  with IdentifiantNonDeclare("condition_inconnue") -> ()
let%test_unit "testTernaireSimpleOk" = 
  let _ = compiler (pathFichiersRat^"testTernaireSimpleOk.rat") in ()
let%test_unit "testVariablePlusPlus" = 
  let _ = compiler (pathFichiersRat^"testVariablePlusPlus.rat") in ()