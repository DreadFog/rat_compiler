open Rat
open PasseTypeRat
(* open Compilateur
open Type
(*open Exceptions*)*)
open Exceptions_non_parametrees


(* ====== Test gestion_pointeurs ====== *)
let%test _ = gestion_pointeurs (Pointeur(Pointeur(Neant))) Neant = Pointeur(Pointeur(Neant))
let%test _ = try
    let _ = gestion_pointeurs Neant (Pointeur(Pointeur(Neant))) = Pointeur(Pointeur(Neant)) in
      false
  with RefInterdite -> true
let%test _ = gestion_pointeurs Neant Neant = Neant
let%test _ = gestion_pointeurs (Pointeur(Pointeur(Neant))) (Pointeur(Pointeur(Neant))) = Neant

