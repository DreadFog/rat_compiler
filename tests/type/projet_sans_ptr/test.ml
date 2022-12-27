open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_identifiants
open Exceptions

exception ErreurNonDetectee
let pathFichiersRat = "./fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testAffectationIncrementee3"= 
  try
    let _ = compiler (pathFichiersRat^"testAffectationIncrementee3.rat")
    in raise ErreurNonDetectee
  with TypeBinaireInattendu(Plus,(Int,Neant),(Bool,Neant)) -> ()
let%test_unit "testIfSansElse2"=
  try
    let _ = compiler (pathFichiersRat^"testIfSansElse2.rat")
    in raise ErreurNonDetectee
  with TypeInattendu((Int,Neant),(Bool,Neant)) -> ()
let%test_unit "testTernaireConditionKo2"=
try
  let _ = compiler (pathFichiersRat^"testTernaireConditionKo2.rat")
  in raise ErreurNonDetectee
with TypeInattendu((Rat,Neant),(Bool,Neant)) -> ()
let%test_unit "testTernaireTypageIncorrect" = 
try
  let _ = compiler (pathFichiersRat^"testTernaireTypageIncorrect.rat")
  in raise ErreurNonDetectee
with TypeInattendu((Int,Neant),(Bool,Neant)) -> ()