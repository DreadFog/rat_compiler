open Rat
open Mtds
open Type
open Exceptions_non_parametrees


(* ====== Test chercherLocalement ====== *)
let%test _ = chercherLocalement (creerTDSMere()) "x" = None
let%test _ = 
  let tds = creerTDSMere() in
  let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
  let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
  ajouter tds "x" ix;
  ajouter tds "y" iy;
  chercherLocalement tds "x" = Some ix
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    chercherLocalement tds "y" = Some iy
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    chercherLocalement tds "z" = None
let%test _ = 
  let tds = creerTDSMere() in
  let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
  let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
  ajouter tds "x" ix;
  ajouter tds "y" iy;
  let tdsf = creerTDSFille(tds) in
  let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
  let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
  ajouter tdsf "x" ix2;
  ajouter tdsf "z" iz;
  chercherLocalement tds "x" = Some ix
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherLocalement tds "y" = Some iy
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherLocalement tds "z" = None
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherLocalement tdsf "y" = None
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherLocalement tdsf "x" = Some ix2
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherLocalement tdsf "z" = Some iz
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherLocalement tdsf "a" = None

(* ====== Test chercherGlobalement ====== *)
let%test _ = chercherGlobalement (creerTDSMere()) "x" = None
let%test _ = 
  let tds = creerTDSMere() in
  let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
  let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
  ajouter tds "x" ix;
  ajouter tds "y" iy;
  chercherGlobalement tds "x" = Some ix
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    chercherGlobalement tds "y" = Some iy
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    chercherGlobalement tds "z" = None
let%test _ = 
  let tds = creerTDSMere() in
  let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
  let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
  ajouter tds "x" ix;
  ajouter tds "y" iy;
  let tdsf = creerTDSFille(tds) in
  let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
  let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
  ajouter tdsf "x" ix2;
  ajouter tdsf "z" iz;
  chercherGlobalement tds "x" = Some ix
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherGlobalement tds "y" = Some iy
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherGlobalement tds "z" = None
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherGlobalement tdsf "y" = Some iy
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherGlobalement tdsf "x" = Some ix2
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherGlobalement tdsf "z" = Some iz
let%test _ = 
    let tds = creerTDSMere() in
    let ix = (InfoVar ("x", ref Rat, ref 0, ref "SB")) in
    let iy = (InfoVar ("y", ref Int, ref 2, ref "SB")) in
    ajouter tds "x" ix;
    ajouter tds "y" iy;
    let tdsf = creerTDSFille(tds) in
    let ix2 = (InfoVar ("x", ref Bool, ref 3, ref "LB")) in
    let iz = (InfoVar ("z", ref Rat, ref 4, ref "LB")) in
    ajouter tdsf "x" ix2;
    ajouter tdsf "z" iz;
    chercherGlobalement tdsf "a" = None


(* ====== Test unwrap ====== *)
let%test _ =
  try 
    let _ = unwrap "a" None (fun a -> "test"^a)
    in failwith "Erreur unwrap"
  with
    IdentifiantNonDeclare("testa") -> true
let%test _ =
    let res = unwrap "a" (Some 1) (fun a -> a) in res = 1

(* ====== Test modifier_type_variable & modifier_adresse_variable ====== *)
let%test _ = 
  let info = InfoVar (("f",Neant), ref Undefined, ref 0, ref "SB") in
  modifier_type_variable Rat info;
  modifier_adresse_variable 1 "LB" info; 
  match info with
    | InfoVar (_, r, d, b) -> !r = Rat && !d = 1 && !b = "LB"
    | _ -> false
let%test _ = 
  let info = InfoConst ("cons", 0) in
    try
      let _ = modifier_type_variable Rat info;
      in failwith "Erreur modifier_type_variable"
    with
      _ -> true
let%test _ = 
  let info = InfoConst ("cons", 0) in
    try
      let _ = modifier_adresse_variable 1 "LB" info;
      in failwith "Erreur modifier_type_variable"
    with
      _ -> true


(* ====== Test ajouter_liste_boucle ====== *)
let%test _ = 
  let info = InfoBoucle [("test","test")] in
  let info' = ajouter_liste_boucle info "a" "b" in
  match info' with
    | InfoBoucle [("a","b"); ("test","test")] -> true 
    | _ -> false