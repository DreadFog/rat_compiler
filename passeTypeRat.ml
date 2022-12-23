(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)

open Mtds
open Exceptions
open Ast
(*open Either*)

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

(*let getTypexMarkOfIast iast = match info_ast_to_info iast with
  InfoVar((_,m),_,_,_) -> (type_of_info_ast iast, m)
  |InfoFun((_,m),_,_) -> (type_of_info_ast iast, m)
  |InfoConst(_) -> (type_of_info_ast iast, Type.Neant) *)

(* analyse_tds_expression : tds -> AstTds.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_type_expression e = match e with
  | AstTds.Identifiant (m,iast) -> ( AstType.Identifiant (m,iast)
                                   , (type_of_info_ast iast, m))
  | AstTds.Entier i -> (AstType.Entier i, (Int, Neant))
  | AstTds.Booleen b -> (AstType.Booleen b, (Bool, Neant))
  | AstTds.NULL -> (AstType.NULL, (Undefined, Pointeur(Neant)))
  | AstTds.Adr (m,a) -> (AstType.Adr (m,a), (type_of_info_ast a, m))
  | AstTds.New n -> (AstType.New n, n)
  | AstTds.Binaire (op, e1, e2) ->
    let (ne1,tm1) = analyse_type_expression e1 in 
    let (ne2,tm2) = analyse_type_expression e2 in 
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
        |_, _ -> raise (TypeBinaireInattendu (op, fst tm1, fst tm2)) (*rq: erreur a adapté avec ptr*)
        )
    else raise (TypeBinaireInattendu (op,fst tm1, fst tm2)) (*rq: erreur a adapté avec ptr*)
  | AstTds.Unaire (op, e) -> 
    let (ne, te) = analyse_type_expression e in
    (match (op, fst te) with
     |Numerateur, Rat -> AstType.Unaire (AstType.Numerateur, ne), (Int,Neant)
     |Denominateur, Rat -> AstType.Unaire (AstType.Denominateur, ne), (Int,Neant)
     |_ -> raise (TypeInattendu (fst te, Rat)) (*rq: erreur a adapté avec ptr*)
     )
  | AstTds.Ternaire(e1, e2, e3) -> 
    let (ne1, te1) = analyse_type_expression e1 in
    let (ne2, te2) = analyse_type_expression e2 in
    let (ne3, te3) = analyse_type_expression e3 in
    if (Type.est_compatible te1 (Bool,Neant)) then
      if (Type.est_compatible te2 te3) then
        (AstType.Ternaire (ne1, ne2, ne3), te2)
      else raise (TypeInattendu (fst te3, fst te2)) (*rq: erreur a adapté avec ptr*)
    else raise (TypeInattendu (fst te1, Bool)) (*rq: erreur a adapté avec ptr*)
  | AstTds.AppelFonction (f, l) -> 
    match f with
      |InfoFun((_,Neant),t,lt) -> (* Vérification du bon nombre d'arguments *)
          let nl = List.map analyse_type_expression l in
          let type_params = List.map snd nl in
          (* check if all params have a correct type*)
          let lt' = List.map (fun (x,(_,y)) -> (!x,y)) lt in
          (* Test des types ET marqueurs *)
          if (Type.est_compatible_list lt' type_params) then
            (AstType.AppelFonction (f, List.map fst nl), (t,Neant))
          else 
            (* Erreur a adapté pour ajouter les ptrs *)
            raise (TypesParametresInattendus (List.map fst lt', List.map fst type_params))
      |InfoFun(_) -> failwith "Pointeurs de fonctions pas encore supporté"
      |_ -> raise ErreurInterne


(* analyse_tds_instruction : tds -> AstTds.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction *)


(* analyse_tds_instruction : tds -> info_ast option -> AstTds.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_type_instruction (i,ctx) =
  (
  (* match pour l'instruction, le ctx est propagé dans les autres ast 
   * -> on renvoi un couple *)
  (match i with
  | AstTds.Declaration (t, n, e) ->
     let nn = (match n with
                InfoVar((_,mv),_,_,_) -> t,mv
                |InfoFun((_,mv),_,_) -> t,mv
                |_ -> raise ErreurInterne) in
     let (ne, tme) = analyse_type_expression e in
     if (Type.est_compatible nn tme) then (
      modifier_type_variable t n; (* modification du type associé *)
      (AstType.Declaration (n, ne))) 
    else raise (TypeInattendu(fst tme, t))
            (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Affectation (m,n,e) ->
    let nn = (match n with
                InfoVar((_,_),t,_,_) -> (!t), m
                |InfoFun((_,_),t,_) -> t, m
                |_ -> raise ErreurInterne) in
     let (ne, tme) = analyse_type_expression e in
     let t = type_of_info_ast n in
     if (Type.est_compatible nn tme) then
          (AstType.Affectation(m, n, ne))
     else raise (TypeInattendu(fst tme,t)) 
        (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Affichage e ->
     let (ne, te) = analyse_type_expression e in
     if snd te <> Neant then raise Exceptions.MarqueurInattendu (* pas de print(&a); *)
     else (match fst te with
      Int -> AstType.AffichageInt ne
      |Bool -> AstType.AffichageBool ne
      |Rat -> AstType.AffichageRat ne
      |_ -> (raise ErreurInterne)
    )
  | AstTds.Conditionnelle (e,b1,b2) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let (ne, te) = (analyse_type_expression e) in
    if (Type.est_compatible te (Bool,Neant)) then 
      AstType.Conditionnelle(ne, analyse_type_bloc b1, analyse_type_bloc b2)
    else raise (TypeInattendu(fst te, Bool))
    (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.TantQue (e,b) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let (ne, te) = (analyse_type_expression e) in
    if (Type.est_compatible te (Bool,Neant)) then 
      AstType.TantQue(ne, analyse_type_bloc b)
    else raise (TypeInattendu(fst te, Bool))
    (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Retour (e,iast) ->
    let (ne, te) = analyse_type_expression e 
    and t = type_of_info_ast iast in
    if (Type.est_compatible (t,Neant) te) then (AstType.Retour(ne, iast))
    else raise (TypeInattendu(fst te, t))
    (* Erreur a adapté pour ajouter les ptrs *)
  | AstTds.Empty -> AstType.Empty
  (* Gestion des boucles*)
  | AstTds.Boucle (ia, b) -> AstType.Boucle (ia, analyse_type_bloc b)
  | AstTds.Break s -> AstType.Break s
  | AstTds.Continue s -> AstType.Continue s)
  , ctx)

(* analyse_tds_bloc : tds -> info_ast option -> AstTds.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_type_bloc b = List.map analyse_type_instruction b

(* analyse_tds_fonction : tds -> AstTds.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_type_fonction (AstTds.Fonction(_,iast,l_param,l_inst)) =
  AstType.Fonction(iast, List.map snd l_param, analyse_type_bloc l_inst)


(* analyser : AstTds.programme -> AstType.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie le bon typage des identifiants et tranforme le programme
en un programme de type AstType.programme *)
(* Erreur si mauvais typage *)
let analyser (AstTds.Programme (fonctions,prog)) =
  let nf = List.map analyse_type_fonction fonctions in
  let nb = analyse_type_bloc prog in
  AstType.Programme (nf,nb)
