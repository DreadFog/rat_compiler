(* Types manipulés dans Rat *)
type typ = Bool | Int | Rat | Undefined

type mark = Neant | Pointeur of mark

(* string_of_type :  typ -> mark -> string *)
(* transforme un typ en chaîne de caractère *)
val string_of_type_mark : (typ*mark) -> string  

(* est_compatible_type : typ -> typ -> bool *)
(* vérifie que le second type est compatible avec le premier *)
(* c'est à dire qu'un élèment du second type peut être affecté *)
(* à un élément du premier type *)
val est_compatible : (typ*mark) -> (typ*mark) -> bool

(* est_compatible_list : typ list -> typ list -> bool *)
(* vérifie si les types sont compatibles deux à deux *)
val est_compatible_list : (typ*mark) list -> (typ*mark) list -> bool

(* getTaille : typ -> int *)
(* Renvoie la taille en mémoire qui doit prendre une variable en fonction de son type *)
val getTaille : typ * mark -> int 
