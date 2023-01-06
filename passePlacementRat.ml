(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)

open Mtds
open Exceptions_non_parametrees
open Ast

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme

(* analyse_placement_instruction : string -> int -> AstType.instruction -> AstType.instruction *)
(* Paramètre reg : le registre courant *)
(* Paramètre depl : le déplacement courant *)
(* Paramètre i : l'instruction à analyser *)
(* Associe à chaque variable déclarée son placement mémoire dans la pile.
   C'est pourquoi seulement les instructions de déclaration, et par suite toute instruction ayant un bloc, sont analysées. *)
let rec analyse_placement_instruction reg depl (i,(_:contexte)) =
  (* ici pas besoin de renvoyer le contexte, on l'a déjà avec analyse_bloc *)
  match i with
  | AstType.Declaration (iast, e) ->
    let mt = (match iast with
                  InfoVar((_,m),t,_,_) -> (!t),m
                  |InfoFun((_,m),[t,_]) -> t,m
                  |_ -> raise ErreurInterne) in
    let taille = Type.getTaille mt in
     modifier_adresse_variable depl reg iast;
     (AstPlacement.Declaration(iast, e), depl+taille)
  | AstType.Affectation (iast, e) ->
     (AstPlacement.Affectation(iast, e), depl)
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
    (match iast with
      InfoFun((_,m), [(ty, param_t)]) ->
        let getSeconds = List.map (fun (c,b) -> (c, snd b)) in
        let add_tailles = (fun param taille -> Type.getTaille param + taille) in
        (*let param_t' = List.map fst param_t in*)
        (AstPlacement.Retour ( e
                             , Type.getTaille (ty,m)
                             , List.fold_right add_tailles (getSeconds param_t) 0)
                             , depl)
      | _ -> raise ErreurInterne);
  | AstType.Empty -> (AstPlacement.Empty, depl)
  (* Prise en compte des boucles *)
  | AstType.Boucle (ia, b) ->
    let nb = fst (analyse_placement_bloc reg depl b) in
    (AstPlacement.Boucle (ia, nb), depl)
  | AstType.Break s -> (AstPlacement.Break s, depl)
  | AstType.Continue s -> (AstPlacement.Continue s, depl)

(* analyse_placement_bloc : string -> int -> AstType.bloc -> AstType.bloc 
  * Paramètre reg : le registre courant
  * Paramètre depl : le déplacement courant
  * Paramètre b : le bloc à analyser
  * Associe à chaque variable du bloc son placement mémoire dans la pile *)
and analyse_placement_bloc reg depl b = 
  let f (pred, taille) inst =
    let (ni,nfdepl) = analyse_placement_instruction reg (taille+depl) inst in
    (pred @ [(ni,snd inst)], nfdepl-depl) in (* a améliorer ? hopefully ocaml fix it*)
  (List.fold_left f ([], 0) b, depl)

(* getTypexMarkOfIast : AstType.info_ast -> Type.type_ast * Type.mark *)
(* Paramètre iast : l'info_ast dont on veut le type et le marquage *)
(* Renvoie le type et le marquage de l'info_ast *)
let getTypexMarkOfIast iast = match iast with
  InfoVar((_,m),_,_,_) -> (type_of_info_ast iast, m)
  |InfoFun((_,m),__) -> (type_of_info_ast iast, m)
  |InfoConst(_) -> (type_of_info_ast iast, Type.Neant)
  |_ -> raise ErreurInterne

(* analyse_placement_fonction : string -> AstType.fonction -> AstType.fonction
  * Paramètre reg : le registre courant
  * Paramètre f : la fonction à analyser
  * Associe à chaque variable de la fonction son placement mémoire dans la pile *)
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
let analyser (AstType.Programme (fonctions,blocs)) =
  let nf = List.map (fun x -> fst (analyse_placement_fonction "LB" x)) fonctions in
  let nb = fst (analyse_placement_bloc "SB" 0 blocs) in
  AstPlacement.Programme (nf,nb)
