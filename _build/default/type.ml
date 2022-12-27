type typ = Bool | Int | Rat | Undefined

type mark = Neant | Pointeur of mark

let rec string_of_type_mark (t,m) = 
  match t, m  with
  | _, Pointeur p -> string_of_type_mark (t,p)^"*" 
  | Bool, _ ->  "Bool"
  | Int, _  ->  "Int"
  | Rat, _  ->  "Rat"
  (*| Pointeur(dsk) -> "Pointeur of " ^ string_of_type dsk*)
  | Undefined, _ -> "Undefined"

let (*rec*) est_compatible (t1,m1) (t2,m2) =
  let typesEq = 
    match t1, t2 with
    | Bool, Bool -> true
    | Int, Int -> true
    | Rat, Rat -> true 
    (*| Pointeur(norman), Pointeur(dirtybiology) ->  est_compatible_type norman dirtybiology (* IT'S A MATCH : choix de l'interdiction du transtypage *)*)
    | _ -> false
  in
  let rec marksEq m m'= 
    match m, m' with
      |Neant, Neant -> true
      |Pointeur p, Pointeur p' -> marksEq p p'
      |_, _ -> false
  in (marksEq m1 m2) && typesEq

let%test _ = est_compatible (Bool, Neant) (Bool,Neant)
(*
let%test _ = est_compatible_type Bool Bool
let%test _ = est_compatible_type Int Int
let%test _ = est_compatible_type Rat Rat
let%test _ = not (est_compatible_type Int Bool)
let%test _ = not (est_compatible_type Bool Int)
let%test _ = not (est_compatible_type Int Rat)
let%test _ = not (est_compatible_type Rat Int)
let%test _ = not (est_compatible_type Bool Rat)
let%test _ = not (est_compatible_type Rat Bool)
let%test _ = not (est_compatible_type Undefined Int)
let%test _ = not (est_compatible_type Int Undefined)
let%test _ = not (est_compatible_type Rat Undefined)
let%test _ = not (est_compatible_type Bool Undefined)
let%test _ = not (est_compatible_type Undefined Int)
let%test _ = not (est_compatible_type Undefined Rat)
let%test _ = not (est_compatible_type Undefined Bool)*)

let est_compatible_list lt1 lt2 =
  try
    List.for_all2 est_compatible lt1 lt2
  with Invalid_argument _ -> false

let%test _ = est_compatible_list [] []
(*let%test _ = est_compatible_list [Int ; Rat] [Int ; Rat]
let%test _ = est_compatible_list [Bool ; Rat ; Bool] [Bool ; Rat ; Bool]
let%test _ = not (est_compatible_list [Int] [Int ; Rat])
let%test _ = not (est_compatible_list [Int] [Rat ; Int])
let%test _ = not (est_compatible_list [Int ; Rat] [Rat ; Int])
let%test _ = not (est_compatible_list [Bool ; Rat ; Bool] [Bool ; Rat ; Bool ; Int])*)

let getTaille (t,m) =
  match t with
  | _ when (m <> Neant) -> 1 (* only the address, so size of one *)
  | Int -> 1
  | Bool -> 1
  | Rat -> 2
  | Undefined -> 0

let%test _ = getTaille (Int, Neant) = 1
let%test _ = getTaille (Bool, Neant) = 1
let%test _ = getTaille (Rat, Neant) = 2
(*let%test _ = getTaille (Pointeur(Int)) = 1*)
