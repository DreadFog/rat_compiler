open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_non_parametrees

exception ErreurNonDetectee
let pathFichiersRat = "./fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testAffectationIncrementee1"= 
    let _ = compiler (pathFichiersRat^"testAffectationIncrementee1.rat") in ()
let%test_unit "testAffectationIncrementee2"= 
  let _ = compiler (pathFichiersRat^"testAffectationIncrementee2.rat") in ()
let%test_unit "testBoucle1"= 
  let _ = compiler (pathFichiersRat^"testBoucle1.rat") in ()
let%test_unit "testBoucle2"= 
  try
    let _ = compiler (pathFichiersRat^"testBoucle2.rat")
    in raise ErreurNonDetectee
  with IdentifiantNonDeclare "test" -> ()
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

let%test_unit "testBoucleIdIncorrect1" = 
  try
    let _ = compiler (pathFichiersRat^"testBoucleIdIncorrect1.rat")
    in raise ErreurNonDetectee
  with DoubleDeclaration("id") -> ()

let%test_unit "testBoucleIdSurcharge" = 
    let _ = compiler (pathFichiersRat^"testBoucleIdSurcharge.rat") in ()

let%test_unit "testBreakIncorrect1" = 
  try
    let _ = compiler (pathFichiersRat^"testBreakIncorrect1.rat")
    in raise ErreurNonDetectee
  with BreakHorsBoucle -> ()

let%test_unit "testBreakIncorrect2" = 
  try
    let _ = compiler (pathFichiersRat^"testBreakIncorrect2.rat")
    in raise ErreurNonDetectee
  with MauvaiseUtilisationIdentifiant("n") -> ()

let%test_unit "testBreakIncorrect3" = 
  try
    let _ = compiler (pathFichiersRat^"testBreakIncorrect3.rat")
    in raise ErreurNonDetectee
  with IdentifiantNonDeclare("inconnu") -> ()

let%test_unit "testContinueIncorrect1" = 
  try
    let _ = compiler (pathFichiersRat^"testContinueIncorrect1.rat")
    in raise ErreurNonDetectee
  with ContinueHorsBoucle -> ()

let%test_unit "testContinueIncorrect2" = 
  try
    let _ = compiler (pathFichiersRat^"testContinueIncorrect2.rat")
    in raise ErreurNonDetectee
  with MauvaiseUtilisationIdentifiant("n") -> ()

let%test_unit "testContinueIncorrect3" = 
  try
    let _ = compiler (pathFichiersRat^"testContinueIncorrect3.rat")
    in raise ErreurNonDetectee
  with IdentifiantNonDeclare("inconnu") -> ()