type typ = Bool | Int | Rat | Pointeur of typ | Undefined

let rec string_of_type t = 
  match t with
  | Bool ->  "Bool"
  | Int  ->  "Int"
  | Rat  ->  "Rat"
  | Pointeur(dsk) -> "Pointeur of " ^ string_of_type dsk
  | Undefined -> "Undefined"

let rec est_compatible_type t1 t2 =
  match t1, t2 with
  | Bool, Bool -> true
  | Int, Int -> true
  | Rat, Rat -> true 
  | Pointeur(norman), Pointeur(dirtybiology) ->  est_compatible_type norman dirtybiology (* IT'S A MATCH : choix de l'interdiction du transtypage *)
  | _ -> false

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
let%test _ = not (est_compatible_type Undefined Bool)

let est_compatible_list lt1 lt2 =
  try
    List.for_all2 est_compatible_type lt1 lt2
  with Invalid_argument _ -> false

let%test _ = est_compatible_list [] []
let%test _ = est_compatible_list [Int ; Rat] [Int ; Rat]
let%test _ = est_compatible_list [Bool ; Rat ; Bool] [Bool ; Rat ; Bool]
let%test _ = not (est_compatible_list [Int] [Int ; Rat])
let%test _ = not (est_compatible_list [Int] [Rat ; Int])
let%test _ = not (est_compatible_list [Int ; Rat] [Rat ; Int])
let%test _ = not (est_compatible_list [Bool ; Rat ; Bool] [Bool ; Rat ; Bool ; Int])

let getTaille t =
  match t with
  | Int -> 1
  | Bool -> 1
  | Rat -> 2
  | Pointeur _ -> 1 (* only the address, so size of one *)
  | Undefined -> 0
  
let%test _ = getTaille Int = 1
let%test _ = getTaille Bool = 1
let%test _ = getTaille Rat = 2
(*let%test _ = getTaille (Pointeur(Int)) = 1*)
