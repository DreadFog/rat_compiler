(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Tam
open Code

type t1 = Ast.AstPlacement.programme
type t2 = String

(* analyse_tds_expression : tds -> AstTds.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec ast_to_tam_expression e = match e with
  | AstTds.Ident s -> let (taille, depl, reg) = Tds.tam_var_of_info_ast s in 
  load taille depl reg
  | AstTds.Entier i -> 
  | AstTds.Booleen b -> 
  | AstTds.Binaire (op, e1, e2) ->
  | AstTds.Unaire (op, e) -> 
  | AstTds.AppelFonction (f, l) -> 


(* analyse_tds_instruction : tds -> info_ast option -> AstPlacement.instruction -> AstPlacement.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstPlacement.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec ast_to_tam_instruction i =
  match i with
  | AstPlacement.Declaration (iast, e) ->
    let (taille, dep, reg) = Tds.tam_var_of_info_ast iast in
    Tam.push taille
    ^ ast_to_tam_expression e
    ^ Tam.store taille dep reg
  | AstPlacement.Affectation (iast, e) ->
    
  | AstPlacement.AffichageInt e ->
  | AstPlacement.AffichageRat e ->
  | AstPlacement.AffichageBool e ->
  | AstPlacement.Conditionnelle (e,b1,b2) ->
  | AstPlacement.TantQue (e,b) ->
  | AstPlacement.Retour (e,iast) ->
  | AstPlacement.Empty -> ""

(* analyse_tds_bloc : tds -> info_ast option -> AstPlacement.bloc -> AstPlacement.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstPlacement.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and ast_to_tam_bloc reg depl b = 
  

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

(* analyse_tds_fonction : tds -> AstPlacement.fonction -> AstPlacement.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstPlacement.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let ast_to_tam_fonction reg (AstPlacement.Fonction(iast,l_param,l_inst)) =
  
(* analyser : AstPlacement.programme -> AstPlacement.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie le bon typage des identifiants et tranforme le programme
en un programme de type AstPlacement.programme *)
(* Erreur si mauvais typage *)
let analyser (AstPlacement.Programme (fonctions,blocs)) =

