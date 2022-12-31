(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)

open Mtds
open Exceptions
open Ast

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme


(*let rec getIast ident = match ident with
  |AstTds.Iast iast -> iast
  |AstTds.Pointeur p -> getIast p

let rec getTypeOfIast ident = match ident with
|AstTds.Iast iast -> type_of_info_ast iast
|AstTds.Pointeur p -> Type.Pointeur (getTypeOfIast p)

let rec getTypeOfDeclaration t n = match n with
  |AstSyntax.Symbole _ -> t
  |AstSyntax.Pointeur p -> Type.Pointeur (getTypeOfDeclaration t p)*)

let getTypexMarkOfIast iast = match iast with
  InfoVar((_,m),t,_,_) -> (!t, m)
  |InfoFun((_,m),t,_) -> (t, m)
  |InfoConst(_) -> (Int, Type.Neant)
  | _ -> raise ErreurInterne
(*let getTypeOfIast iast = match iast with
  InfoVar(_,t,_,_) -> !t
  |InfoFun(_,t,_) -> t
  |InfoConst(_) -> Int
  | _ -> raise ErreurInterne*)

(* gestion du cas : (1) int ***a =...; (2) *a = ...; 
 * il faut a dte de (2) un int ** :
 * pour cela il faut enlever aux mv * les m * de l'affectations
 * erreur si m > mv
 *)
 let rec gestion_pointeurs minit mcall = match minit, mcall with
 Type.Neant, (Type.Pointeur _) ->
         raise Exceptions_identifiants.RefInterdite
 |(Type.Pointeur _), Type.Neant ->
         minit
 |(Type.Pointeur pinit), (Type.Pointeur pcall) -> 
         gestion_pointeurs pinit pcall
 |Type.Neant, Type.Neant ->
         Type.Neant

(* analyse_type_expression : AstTds.expression * contexte -> AstType.expression *)
(* Paramètre e : l'expression à analyser *)
(* Paramètre ctx : le contexte *)
(* Retourne l'expression d'entrée conformément typée, ainsi que le type et la marque de l'expression *)
(* Erreur si mauvaise logique au niveau des types dans le programme *)
let rec analyse_type_expression (e,(ctx:contexte)) = match e with
  | AstTds.Identifiant (iast,dm) -> 
    let (t,m) = getTypexMarkOfIast iast in
    (AstType.Identifiant (iast,dm), (t,gestion_pointeurs m dm))
  | AstTds.Entier i -> (AstType.Entier i, (Int, Neant))
  | AstTds.Booleen b -> (AstType.Booleen b, (Bool, Neant))
  | AstTds.NULL -> (AstType.NULL, (Undefined, Pointeur(Neant)))
  | AstTds.Adr (a,dm) -> 
    let (t,m) = getTypexMarkOfIast a in
    (AstType.Adr (a,dm), (t, Pointeur(gestion_pointeurs m dm)))
  | AstTds.New n -> let (t,m) = n in (AstType.New n, (t, Pointeur(m)))
  | AstTds.Binaire (op, e1, e2) ->
    let (ne1,tm1) = analyse_type_expression (e1,ctx) in 
    let (ne2,tm2) = analyse_type_expression (e2,ctx) in 
    if (Type.est_compatible tm1 tm2) then 
      (match (op, fst tm1) with
        Fraction, Int -> (AstType.Binaire (AstType.Fraction, ne1, ne2), (Rat,Neant))
        |Plus, Int -> (AstType.Binaire (AstType.PlusInt, ne1, ne2), (Int,Neant))
        |Plus, Rat -> (AstType.Binaire (AstType.PlusRat, ne1, ne2), (Rat,Neant))
        |Mult, Int -> (AstType.Binaire (AstType.MultInt, ne1, ne2), (Int,Neant))
        |Mult, Rat -> (AstType.Binaire (AstType.MultRat, ne1, ne2), (Rat,Neant))
        |Equ, Int -> (AstType.Binaire (AstType.EquInt, ne1, ne2), (Bool,Neant))
        |Equ, Bool -> (AstType.Binaire (AstType.EquBool, ne1, ne2), (Bool,Neant))
        |Inf, Int -> (AstType.Binaire (AstType.Inf, ne1, ne2), (Bool,Neant))
        |_, _ -> afficher_erreur (TypeBinaireInattendu (op, tm1, tm2)) ctx
        )
    else afficher_erreur (TypeBinaireInattendu (op, tm1, tm2)) ctx
  | AstTds.Unaire (op, e) -> 
    let (ne, te) = analyse_type_expression (e,ctx) in
    (match (op, fst te) with
     |Numerateur, Rat -> AstType.Unaire (AstType.Numerateur, ne), (Int,Neant)
     |Denominateur, Rat -> AstType.Unaire (AstType.Denominateur, ne), (Int,Neant)
     |_ -> afficher_erreur (TypeInattendu (te, (Rat,Neant))) ctx
     )
  (* Implémentation du ternaire *)
  | AstTds.Ternaire(e1, e2, e3) -> 
    let (ne1, te1) = analyse_type_expression (e1,ctx) in
    let (ne2, te2) = analyse_type_expression (e2,ctx) in
    let (ne3, te3) = analyse_type_expression (e3,ctx) in
    (* la première expression doit être booléenne *)
    if (Type.est_compatible te1 (Bool,Neant)) then
      (* les deux autres doivent être du même type *)
      if (Type.est_compatible te2 te3) then
        (AstType.Ternaire (ne1, ne2, ne3), te2)
      else afficher_erreur (TypeInattendu (te3, te2)) ctx
    else afficher_erreur (TypeInattendu (te1, (Bool,Neant))) ctx
  | AstTds.AppelFonction (f, l) -> 
    match f with
      |(InfoFun((_,Neant),t,lt),Neant) -> (* Vérification du bon nombre d'arguments *)
          let nl = List.map (fun x -> analyse_type_expression (x,ctx)) l in
          let type_params = List.map snd nl in
          (* check if all params have a correct type*)
          let lt' = List.map (fun (x,(_,y)) -> (!x,y)) lt in
          (* Test des types ET marqueurs *)
          if (Type.est_compatible_list lt' type_params) then
            (AstType.AppelFonction (f, List.map fst nl), (t,Neant))
          else 
            (* Erreur a adapté pour ajouter les ptrs *)
            afficher_erreur (TypesParametresInattendus (lt', type_params)) ctx
      |(InfoFun(_),_) -> failwith "Pointeurs de fonctions pas encore supporté"
      |_ -> raise ErreurInterne


(* analyse_type_instruction : AstTds.instruction * contexte -> AstType.instruction
  * Analyse le type d'une instruction et renvoi une instruction typée
  * Paramètres : 
  *   - i : l'instruction à analyser
  *   - ctx : le contexte de l'instruction
  * Erreur si les types ne sont pas compatibles *)
let rec analyse_type_instruction (i,(ctx:contexte)) =
  (
  (* match pour l'instruction, le ctx est propagé dans les autres ast 
   * -> on renvoi un couple *)
  (match i with
  | AstTds.Declaration (t, (n,mv), e) ->
     let (ne, tme) = analyse_type_expression (e,ctx) in
     if (Type.est_compatible (t,mv) tme) then (
      modifier_type_variable t n; (* modification du type associé *)
      (AstType.Declaration (n, ne))) 
    else afficher_erreur (TypeInattendu(tme, (t,mv))) ctx
            (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Affectation ((n,dm),e) ->
    let (t,m) = getTypexMarkOfIast n in
     let (ne, tme) = analyse_type_expression (e,ctx) in
     if (Type.est_compatible (t,gestion_pointeurs m dm) tme) then
          (AstType.Affectation((n,dm), ne))
     else afficher_erreur (TypeInattendu(tme, (t,gestion_pointeurs m dm))) ctx 
        (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Affichage e ->
     let (ne, te) = analyse_type_expression (e,ctx) in
     if snd te <> Neant then raise Exceptions.MarqueurInattendu (* pas de print(&a); *)
     else (match fst te with
      Int -> AstType.AffichageInt ne
      |Bool -> AstType.AffichageBool ne
      |Rat -> AstType.AffichageRat ne
      |_ -> (raise ErreurInterne)
    )
  | AstTds.Conditionnelle (e,b1,b2) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let (ne, te) = (analyse_type_expression (e,ctx)) in
    if (Type.est_compatible te (Bool,Neant)) then 
      AstType.Conditionnelle(ne, analyse_type_bloc b1, analyse_type_bloc b2)
    else afficher_erreur (TypeInattendu(te, (Bool,Neant))) ctx
    (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.TantQue (e,b) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let (ne, te) = (analyse_type_expression (e,ctx)) in
    if (Type.est_compatible te (Bool,Neant)) then 
      AstType.TantQue(ne, analyse_type_bloc b)
    else afficher_erreur (TypeInattendu(te, (Bool,Neant))) ctx
    (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Retour (e,iast) ->
    let (ne, te) = analyse_type_expression (e,ctx) 
    and t = type_of_info_ast iast in
    if (Type.est_compatible (t,Neant) te) then (AstType.Retour(ne, iast))
    else afficher_erreur (TypeInattendu(te, (t,Neant))) ctx
    (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Empty -> AstType.Empty
  (* Gestion des boucles
     * Une gestion de typage au niveau du bloc de la boucle est nécessaire.*)
  | AstTds.Boucle (ia, b) -> AstType.Boucle (ia, analyse_type_bloc b)
  | AstTds.Break s -> AstType.Break s
  | AstTds.Continue s -> AstType.Continue s)
  , ctx)

(* analyse_type_bloc : AstTds.bloc -> AstType.bloc 
  * Analyse le type d'un bloc et renvoi un bloc typé
  * Paramètres : 
  *   - b : le bloc à analyser
  * Erreur potentielle propagée de l'analyse du bloc *)  
and analyse_type_bloc b = List.map analyse_type_instruction b

(* analyse_type_fonction : AstTds.fonction -> AstType.fonction *)
(* Analyse le type d'une fonction et renvoi une fonction typée *)
(* Paramètres : 
  *   - f : la fonction à analyser
  * Erreur si mauvais typage au niveau des instructions de la fonction *)
let analyse_type_fonction (AstTds.Fonction(_,iast,l_param,l_inst)) =
  AstType.Fonction(iast, List.map snd l_param, analyse_type_bloc l_inst)


(* analyser : AstTds.programme -> AstType.programme 
  * Analyse le type d'un programme et renvoi un programme typé
  * Paramètres : 
  *   - prog : le programme à analyser
  * Erreur si mauvais typage au sein du programme *)
let analyser (AstTds.Programme (fonctions,prog)) =
  let nf = List.map analyse_type_fonction fonctions in
  let nb = analyse_type_bloc prog in
  AstType.Programme (nf,nb)
