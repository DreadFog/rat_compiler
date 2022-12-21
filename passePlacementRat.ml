(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)

open Mtds
open Exceptions
open Ast

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme


(* analyse_tds_instruction : tds -> info_ast option -> AstType.instruction -> AstType.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstType.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_placement_instruction reg depl i =
  match i with
  | AstType.Declaration (iast, e) ->
    let mt = (match info_ast_to_info iast with
                  InfoVar((_,m),t,_,_) -> t,m
                  |InfoFun((_,m),t,_) -> t,m
                  |_ -> raise ErreurInterne) in
    let taille = Type.getTaille mt in
     modifier_adresse_variable depl reg iast;
     (AstPlacement.Declaration(iast, e), depl+taille)
  | AstType.Affectation (m, iast, e) ->
     (AstPlacement.Affectation(m, iast, e), depl)
  | AstType.AffichageInt e ->
     (AstPlacement.AffichageInt e, depl)
  | AstType.AffichageRat e ->
    (AstPlacement.AffichageRat e, depl)
  | AstType.AffichageBool e ->
    (AstPlacement.AffichageBool e, depl)
  | AstType.Conditionnelle (e,b1,b2) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let nb1 = fst (analyse_placement_bloc reg depl b1) in
    let nb2 = fst (analyse_placement_bloc reg depl b2) in 
    (AstPlacement.Conditionnelle (e, nb1, nb2), depl)
  | AstType.TantQue (e,b) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let nb = fst (analyse_placement_bloc reg depl b) in
    (AstPlacement.TantQue (e, nb), depl)
  | AstType.Retour (e,iast) ->
    (match info_ast_to_info iast with
      InfoFun((_,m), ty, param_t) ->
        let getSeconds = List.map (fun (c,b) -> (c, snd b)) in
        let add_tailles = (fun param taille -> Type.getTaille param + taille) in
        (*let param_t' = List.map fst param_t in*)
        (AstPlacement.Retour ( e
                             , Type.getTaille (ty,m)
                             , List.fold_right add_tailles (getSeconds param_t) 0)
                             , depl)
      | _ -> raise ErreurInterne);
  | AstType.Empty -> (AstPlacement.Empty, depl)

(* analyse_tds_bloc : tds -> info_ast option -> AstType.bloc -> AstType.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstType.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)

(* and analyse_placement_bloc reg depl b = 
  let f (pred, fdepl) inst =
    let (ni,nfdepl) = analyse_placement_instruction reg fdepl inst in
    (pred @ [ni], nfdepl) in (* a améliorer ? hopefully ocaml fix it*)
  (List.fold_left f ([], depl) b, depl) *)
and analyse_placement_bloc reg depl b = 
  let f (pred, taille) inst =
    let (ni,nfdepl) = analyse_placement_instruction reg (taille+depl) inst in
    (pred @ [ni], nfdepl-depl) in (* a améliorer ? hopefully ocaml fix it*)
  (List.fold_left f ([], 0) b, depl)

(* snd_zip : ('a*'b) list -> ('c*'d) list -> ('b*'d) lits *)
(* Paramètres : les listes a fusionnées *)
(* Fusionne des listes [(ai,bi)] en [(b1,b2)] *)
(* fzip avec snd mais la gestion de polymorphisme avec fzip n'est bien gérée par caml *)
let snd_zip l1 l2 = List.combine (List.map snd l1) (List.map snd l2)

(* second : ('a -> 'b) -> 'c*'a -> 'c*'b *)
(* Application de f sur le second élément d'un couple *)
let second f (x,y) = (x, f y) 

(* first : ('a -> 'b) -> 'c*'a -> 'c*'b *)
(* Application de f sur le premier élément d'un couple *)
let first f (x,y) = (f x, y)

let getTypexMarkOfIast iast = match info_ast_to_info iast with
  InfoVar((_,m),_,_,_) -> (type_of_info_ast iast, m)
  |InfoFun((_,m),_,_) -> (type_of_info_ast iast, m)
  |InfoConst(_) -> (type_of_info_ast iast, Type.Neant) 

(* analyse_tds_fonction : tds -> AstType.fonction -> AstType.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstType.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_placement_fonction reg (AstType.Fonction(iast,l_param,l_inst)) =
  (* traitement des paramères *)
  (* f(int a, int b) -> @a : -4LB; @b : -3LB *)
  let f param fdepl =
    let taille = Type.getTaille (getTypexMarkOfIast param) in
     modifier_adresse_variable (fdepl - taille) reg param;
     fdepl - taille in 
  let _ = List.fold_right f l_param 0 in
  (* traitement des instructions *)
  let (nb, taille) = analyse_placement_bloc reg 3 l_inst in
  (AstPlacement.Fonction(iast, l_param, nb), taille)

(* analyser : AstType.programme -> AstPlacement.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie le bon typage des identifiants et tranforme le programme
en un programme de type AstPlacement.programme *)
(* Erreur si mauvais typage *)
let analyser (AstType.Programme (fonctions,blocs)) =
  let nf = List.map (fun x -> fst (analyse_placement_fonction "LB" x)) fonctions  in
  let nb = fst (analyse_placement_bloc "SB" 0 blocs) in
  AstPlacement.Programme (nf,nb)
