open Bool
open Rat
open Type

(* ====== Test est_compatible ====== *)
let%test _ = est_compatible (Bool, Neant) (Bool, Neant)
let%test _ = est_compatible (Int, Neant) (Int, Neant)
let%test _ = est_compatible (Rat, Neant) (Rat, Neant)
let%test _ = est_compatible (Bool, Pointeur(Pointeur(Neant))) (Bool, Pointeur(Pointeur(Neant)))
let%test _ = not (est_compatible (Bool, Pointeur(Pointeur(Neant))) (Bool, Pointeur(Neant)))
let%test _ = not (est_compatible (Int, Neant) (Bool, Neant))
let%test _ = not (est_compatible (Bool, Neant) (Int, Neant))
let%test _ = not (est_compatible (Int, Neant) (Rat, Neant))
let%test _ = not (est_compatible (Rat, Neant) (Int, Neant))
let%test _ = not (est_compatible (Bool, Neant) (Rat, Neant))
let%test _ = not (est_compatible (Rat, Neant) (Bool, Neant))
let%test _ = not (est_compatible (Undefined, Neant) (Int, Neant))
let%test _ = not (est_compatible (Int, Neant) (Undefined, Neant))
let%test _ = not (est_compatible (Rat, Neant) (Undefined, Neant))
let%test _ = not (est_compatible (Bool, Neant) (Undefined, Neant))
let%test _ = not (est_compatible (Undefined, Neant) (Int, Neant))
let%test _ = not (est_compatible (Undefined, Neant) (Rat, Neant))
let%test _ = not (est_compatible (Undefined, Neant) (Bool, Neant))
let%test _ = not (est_compatible (Int, Pointeur(Neant)) (Int,Pointeur(Pointeur(Neant))))


(* ====== Test est_compatible_list ====== *)
let%test _ = est_compatible_list [] []
let%test _ = est_compatible_list [(Int, Neant) ; (Rat, Neant)] [(Int, Neant) ; (Rat, Neant)]
let%test _ = est_compatible_list [(Bool, Neant) ; (Rat, Neant) ; (Bool, Neant)] [(Bool, Neant) ; (Rat, Neant) ; (Bool, Neant)]
let%test _ = est_compatible_list [(Bool, Pointeur(Neant)) ; (Rat, Neant) ; (Bool, Neant)] [(Bool, Pointeur(Neant)) ; (Rat, Neant) ; (Bool, Neant)]
let%test _ = not (est_compatible_list [(Int, Neant)] [(Int, Neant) ; (Rat, Neant)])
let%test _ = not (est_compatible_list [(Int, Neant)] [(Rat, Neant) ; (Int, Neant)])
let%test _ = not (est_compatible_list [(Int, Neant) ; (Rat, Neant)] [(Rat, Neant) ; (Int, Neant)])
let%test _ = not (est_compatible_list [(Bool, Neant) ; (Rat, Neant) ; (Bool, Neant)] [(Bool, Neant) ; (Rat, Neant) ; (Bool, Neant) ; (Int, Neant)])
let%test _ = not (est_compatible_list [(Bool, Neant) ; (Rat, Neant) ; (Bool, Neant)] [(Bool, Pointeur(Neant)) ; (Rat, Neant) ; (Bool, Neant)])

(* ====== Test getTaille ====== *)
let%test _ = getTaille (Int, Neant) = 1
let%test _ = getTaille (Rat, Pointeur(Neant)) = 1
let%test _ = getTaille (Bool, Neant) = 1
let%test _ = getTaille (Rat, Neant) = 2