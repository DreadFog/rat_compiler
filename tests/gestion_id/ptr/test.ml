open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_non_parametrees

exception ErreurNonDetectee
let pathFichiersRat = "../../../../../tests/gestion_id/ptr/fichiersRat/"

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
let%test_unit "testPtrFonction"= 
    try
        let _ = compiler (pathFichiersRat^"testPtrFonction.rat")
    in raise ErreurNonDetectee
    with
        | MauvaiseUtilisationIdentifiant "f" -> ()