(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)
open Mtds
open Exceptions
open Ast
open Either

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme


let rec getIast ident = match ident with
  |AstTds.Iast iast -> iast
  |AstTds.Pointeur p -> getIast p

let rec getTypeOfIast ident = match ident with
|AstTds.Iast iast -> type_of_info_ast iast
|AstTds.Pointeur p -> Type.Pointeur (getTypeOfIast p)

let rec getTypeOfDeclaration t n = match n with
  |AstSyntax.Symbole _ -> t
  |AstSyntax.Pointeur p -> Type.Pointeur (getTypeOfDeclaration t p)

(* analyse_tds_expression : tds -> AstTds.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_type_expression e = match e with
  | AstTds.Identifiant s -> (AstType.Identifiant s, getTypeOfIast s)
  | AstTds.Entier i -> (AstType.Entier i, Int)
  | AstTds.Booleen b -> (AstType.Booleen b, Bool)
  | AstTds.NULL -> (AstType.NULL, Pointeur(Undefined))
  | AstTds.Adr a -> (AstType.Adr a, Pointeur (getTypeOfIast a))
  | AstTds.New n -> (AstType.New n, n)
  | AstTds.Binaire (op, e1, e2) ->
    let (ne1,te1) = analyse_type_expression e1 in 
    let (ne2,te2) = analyse_type_expression e2 in 
    if (Type.est_compatible_type te1 te2) then 
      (match (op,te1) with
        Fraction,Int -> (AstType.Binaire (AstType.Fraction, ne1, ne2), Rat)
        |Plus, Int -> (AstType.Binaire (AstType.PlusInt, ne1, ne2), te1)
        |Plus, Rat -> (AstType.Binaire (AstType.PlusRat, ne1, ne2), te1)
        |Mult, Int -> (AstType.Binaire (AstType.MultInt, ne1, ne2), te1)
        |Mult, Rat -> (AstType.Binaire (AstType.MultRat, ne1, ne2), te1)
        |Equ, Int -> (AstType.Binaire (AstType.EquInt, ne1, ne2), Bool)
        |Equ, Bool -> (AstType.Binaire (AstType.EquBool, ne1, ne2), Bool)
        |Inf, Int -> (AstType.Binaire (AstType.Inf, ne1, ne2), Bool)
        |_,_ -> raise (TypeBinaireInattendu (op, te1, te2))
        )   
    else raise (TypeBinaireInattendu (op,te1, te2))
  | AstTds.Unaire (op, e) -> 
    let (ne, te) = analyse_type_expression e in
    (match (op, te) with
     |Numerateur, Rat -> AstType.Unaire (AstType.Numerateur, ne), Int
     |Denominateur, Rat -> AstType.Unaire (AstType.Denominateur, ne), Int
     |_ -> raise (TypeInattendu (te, Rat))
     )
  | AstTds.AppelFonction (f, l) -> 
    match info_ast_to_info (getIast f) with
      |InfoFun(_,t,lt) -> (* Vérification du bon nombre d'arguments *)
          let nl = List.map analyse_type_expression l in
          let type_params = List.map snd nl in
          (* check if all params have a correct type*)
          let lt' = List.map fst lt in
          if (List.equal (=) lt' type_params) then
            (AstType.AppelFonction (f, List.map fst nl), t)
          else 
            raise (TypesParametresInattendus (lt', type_params))
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
let rec analyse_type_instruction i =
  match i with
  | AstTds.Declaration (t, n, e) ->
     let id = (match info_ast_to_info n with
                InfoVar(i,_,_,_) -> i
                |InfoFun(i,_,_) -> i
                |_ -> raise ErreurInterne) in
     let ntype = getTypeOfDeclaration t id in
     let (ne, te) = analyse_type_expression e in
     if (Type.est_compatible_type ntype te) then (
      modifier_type_variable t n; (* modification du type associé *)
      (AstType.Declaration (n, ne))) 
    else raise (TypeInattendu(te, t))
  | AstTds.Affectation (n,e) ->
    let (id,tn) = (match info_ast_to_info n with
               InfoVar(i,t,_,_) -> (i,t)
               |_ -> raise ErreurInterne) in
     let ntype = getTypeOfDeclaration tn id in
     let (ne, te) = analyse_type_expression e in
     let t = type_of_info_ast n in
     if ((Type.est_compatible_type ntype te)
        || (te = Undefined && match t with Pointeur _ -> true | _ -> false)) then
          (AstType.Affectation(n, ne))
     else raise (TypeInattendu(te,t)) 
  | AstTds.Affichage e ->
     let (ne, te) = analyse_type_expression e in
     (match te with
      Int -> AstType.AffichageInt ne
      |Bool -> AstType.AffichageBool ne
      |Rat -> AstType.AffichageRat ne
      |_ -> (raise ErreurInterne)
    )
  | AstTds.Conditionnelle (e,b1,b2) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let (ne, te) = (analyse_type_expression e) in
    if (Type.est_compatible_type te Bool) then 
      AstType.Conditionnelle(ne, analyse_type_bloc b1, analyse_type_bloc b2)
    else raise (TypeInattendu(te, Bool))
  | AstTds.TantQue (e,b) ->
    (* Vérification que la conditionnelle est bien booléenne *)
    let (ne, te) = (analyse_type_expression e) in
    if (Type.est_compatible_type te Bool) then 
      AstType.TantQue(ne, analyse_type_bloc b)
    else raise (TypeInattendu(te, Bool))
  | AstTds.Retour (e,iast) ->
    let (ne, te) = analyse_type_expression e 
    and t = type_of_info_ast iast in
    if (Type.est_compatible_type t te) then (AstType.Retour(ne, iast))
    else raise (TypeInattendu(te,t)) 
  | AstTds.Empty -> AstType.Empty

(* analyse_tds_bloc : tds -> info_ast option -> AstTds.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_type_bloc b = List.map analyse_type_instruction b
   
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
  let nf = List.map (analyse_type_fonction ) fonctions in
  let nb = analyse_type_bloc  prog in
  AstType.Programme (nf,nb)
 