open Rat
open Compilateur

exception ErreurNonDetectee
let pathFichiersRat = "../../../../tests/parseur/fichiersRat/"

(**********)
(*  TESTS *)
(**********)

let%test_unit "testAffectation"= 
    try
        let _ = compiler (pathFichiersRat^"testAffectation.rat")
        in raise ErreurNonDetectee
    with Parser.Error -> ()
let%test_unit "testDoubleEsperluette"= 
    try
        let _ = compiler (pathFichiersRat^"testDoubleEsperluette.rat")
    in raise ErreurNonDetectee
    with Parser.Error -> ()