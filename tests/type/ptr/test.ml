open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_identifiants

exception ErreurNonDetectee
let pathFichiersRat = "./fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testAffectation1"= 
    try
        let _ = compiler (pathFichiersRat^"testAffectation1.rat")
        in raise ErreurNonDetectee
    with RefInterdite -> ()

let%test_unit "testAffectation2"= 
    let _ = compiler (pathFichiersRat^"testAffectation2.rat") in ()