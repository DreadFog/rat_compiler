open Rat
open PasseTdsRat
open Compilateur
open Type
(*open Exceptions*)
open Exceptions_identifiants

(* ====== Test snd_zip, second, first, addSecond ====== *)
let%test _ = snd_zip [] [] = []
let%test _ = snd_zip [(1,"2");(3,"4")] [(5,true);(7,false)] = [("2",true);("4",false)]
let%test _ = second ((+) 1) ("1",0) = ("1",1)
let%test _ = first ((+) 1) (-1,true) = (0,true)

(* ====== Test gestion_pointeurs ====== *)
let%test _ = gestion_pointeurs (Pointeur(Pointeur(Neant))) Neant = Pointeur(Pointeur(Neant))
let%test _ = try
    let _ = gestion_pointeurs Neant (Pointeur(Pointeur(Neant))) = Pointeur(Pointeur(Neant)) in
      false
  with RefInterdite -> true
let%test _ = gestion_pointeurs Neant Neant = Neant
let%test _ = gestion_pointeurs (Pointeur(Pointeur(Neant))) (Pointeur(Pointeur(Neant))) = Neant

