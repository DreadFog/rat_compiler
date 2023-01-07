open Rat
open Compilateur
(*open Exceptions*)
open Exceptions_non_parametrees
open Exceptions
open Type

exception ErreurNonDetectee
let pathFichiersRat = "../../../../../tests/type/ptr/fichiersRat/"

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

let%test_unit "testAffectation3"=
    try
        let _ = compiler (pathFichiersRat^"testAffectation3.rat")
        in raise ErreurNonDetectee 
    with TypeInattendu((Int,Pointeur(Neant)),(Int,Neant)) -> ()

