type typ = Bool | Int | Rat | Undefined

type mark = Neant | Pointeur of mark

(* string_of_type :  typ -> mark -> string
 * Paramètre : (t,m) respectivement le type et la marque d'une variable
 * transforme un typ en chaîne de caractère *)
let rec string_of_type_mark (t,m) = 
  match t, m  with
  | _, Pointeur dsk -> string_of_type_mark (t,dsk)^"Ptr" 
  | Bool, _ ->  "Bool"
  | Int, _  ->  "Int"
  | Rat, _  ->  "Rat"
  | Undefined, _ -> "Undefined"

(* est_compatible : (typ * mark) -> (typ * mark) -> bool
 * est_compatible (t1,m1) (t2,m2) renvoie true si les types t1 et t2
 * sont compatibles, c'est à dire si t1 et t2 sont de même type et
 * si les marques m1 et m2 sont compatibles.
 * Par exemple, est_compatible (Int, Neant) (Int, Neant) renvoie true
 * alors que est_compatible (Int, Neant) (Int, Pointeur(Neant)) renvoie false
 * et que est_compatible (Int, Neant) (Rat, Neant) renvoie false.
 * On suppose que les types sont Bool, Int, Rat ou Undefined.
 * On suppose que les marques sont Neant ou Pointeur de marques. *)
let est_compatible (t1,m1) (t2,m2) =
  let typesEq = 
    match t1, t2 with
    | Bool, Bool -> true
    | Int, Int -> true
    | Rat, Rat -> true 
    | _ -> false
  in
  let rec marksEq m m'= 
    match m, m' with
      |Neant, Neant -> true
      |Pointeur norman, Pointeur dirtybiology -> marksEq norman dirtybiology
      |_, _ -> false
  in (marksEq m1 m2) && typesEq

(* est_compatible_list : (typ * mark) list -> (typ * mark) list -> bool
 * est_compatible_list lt1 lt2 renvoie true si les listes de types lt1 et lt2
 * sont compatibles, c'est à dire si les listes ont la même longueur et si
 * les types de même position dans les listes sont compatibles.
 * Par exemple, est_compatible_list [(Int, Neant); (Bool, Neant)] [(Int, Neant); (Bool, Neant)]
 * renvoie true alors que est_compatible_list [(Int, Neant); (Bool, Neant)] [(Int, Neant); (Bool, Pointeur(Neant))]
 * renvoie false.
 * On suppose que les types sont Bool, Int, Rat ou Undefined.
 * On suppose que les marques sont Neant ou Pointeur de marques. *)
let est_compatible_list lt1 lt2 =
  try
    List.for_all2 est_compatible lt1 lt2
  with Invalid_argument _ -> false

(* getTaille : (typ,mark) -> int
 * Paramètre : (t,m) respectivement le type et la marque d'une variable
 * Renvoie la taille en mémoire qui doit prendre une variable en fonction de son type *)
let getTaille (t,m) =
  match t with
  | _ when (m <> Neant) -> 1 (* Seulement l'@ -> de taille 1 *)
  | Int -> 1
  | Bool -> 1
  | Rat -> 2
  | Undefined -> 0

(* Test pour éviter les warnings
 * Tous les tests unitaires sont réalisés dans Utests/type_tests.ml *)
let%test _ = 
let _ = string_of_type_mark in
let _ = est_compatible in
let _ = est_compatible_list in 
let _ = getTaille in true