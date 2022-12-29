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
    let _ = compiler (pathFichiersRat^"testAffectation1.rat") in ()
let%test_unit "testAffectation2"= 
    let _ = compiler (pathFichiersRat^"testAffectation2.rat") in ()
let%test_unit "testDblDeclaration"= 
    try
      let _ = compiler (pathFichiersRat^"testDblDeclaration.rat")
      in raise ErreurNonDetectee
    with DoubleDeclaration "x" -> ()
let%test_unit "testPtrConstante"= 
    try
    let _ = compiler (pathFichiersRat^"testPtrConstante.rat")
    in raise ErreurNonDetectee
    with RefInterdite -> ()