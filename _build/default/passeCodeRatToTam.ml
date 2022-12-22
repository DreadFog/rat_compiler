(* Module de la passe de gestion du typage *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Tam
open Code

type t1 = Ast.AstPlacement.programme
type t2 = string

(* analyse_tds_expression : tds -> AstTds.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec ast_to_tam_expression e = match e with
  | AstType.Ident s -> let (taille, depl, reg) = Tds.tam_var_of_info_ast s in 
    load taille depl reg
  | AstType.Entier i -> loadl_int i 
  | AstType.Booleen b -> loadl_int (Bool.to_int b)
  | AstType.Binaire (op, e1, e2) -> 
    let ne1 = ast_to_tam_expression e1
    and ne2 = ast_to_tam_expression e2 in
    ne1 ^ ne2 ^ (
      match op with
      | Fraction -> "\n" (* les deux entiers sont déjà dans l'ordre d'un rationnel *)
      | PlusInt -> subr "IAdd"
      | PlusRat -> call "ST" "radd" (* ST est inutile mais cet argument est utile en cas d'appel croisé *)
      | MultInt -> subr "IMul"
      | MultRat -> call "ST" "rmul"
      | EquInt -> subr "IEq"
      | EquBool -> subr "IEq"
      | Inf -> subr "ILss"
    )
  | AstType.Unaire (op, e) -> 
    ast_to_tam_expression e (* Met un rat en haut de pile *)
    ^ (
      match op with
      (* idée: on a le résultat en sommet de pile ( -1 et -2 ST
          si on désire le numérateur, on pop 1 pour avoir ST au bon endroit
          si on désire le dénominateur, on déplace celui-ci en -2 ST et on pop 1)*)
      | Numerateur -> pop 0 1
      | Denominateur -> store 1 (-2) "ST" 
    )
  | AstType.AppelFonction (f, l) -> let info_f = info_ast_to_info f in
    (match info_f with
    | InfoFun (name, _, _) ->
      List.fold_left (fun acc e -> acc ^ ast_to_tam_expression e) "" l
      ^ call "ST" name
    | _ -> raise Exceptions.ErreurInterne 
    )
  | AstType.Ternaire(e1, e2, e3) -> 
      let labElse = getEtiquette ()
      and labEndIF = getEtiquette () in
      ast_to_tam_expression e1
      ^ jumpif 0 labElse
      ^ ast_to_tam_expression e2
      ^ jump labEndIF
      ^ label labElse
      ^ ast_to_tam_expression e3
      ^ label labEndIF
      


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
    push taille
    ^ ast_to_tam_expression e
    ^ store taille dep reg
  | AstPlacement.Affectation (iast, e) ->
    let (taille, dep, reg) = Tds.tam_var_of_info_ast iast in
    ast_to_tam_expression e
    ^ store taille dep reg
  | AstPlacement.AffichageInt e ->
    ast_to_tam_expression e
    ^ subr "IOut"
  | AstPlacement.AffichageRat e ->
    ast_to_tam_expression e
    ^ call "SB" "ROut"
  | AstPlacement.AffichageBool e ->
    ast_to_tam_expression e
    ^ subr "BOut"
  | AstPlacement.Conditionnelle (e,b1,b2) ->
    let labIf = getEtiquette ()
    and labElse = getEtiquette ()
    and labEndIF = getEtiquette () in
    label labIf
    ^ ast_to_tam_expression e
    ^ jumpif 0 labElse
    ^ ast_to_tam_bloc b1
    ^ jump labEndIF
    ^ label labElse
    ^ ast_to_tam_bloc b2
    ^ label labEndIF
  | AstPlacement.TantQue (e,b) ->
    let labLoop = getEtiquette ()
    and labEndLoop = getEtiquette () in
    label labLoop
    ^ ast_to_tam_expression e
    ^ jumpif 0 labEndLoop
    ^ ast_to_tam_bloc b
    ^ jump labLoop
    ^ label labEndLoop
  | AstPlacement.Retour (e, taille_ret, taille_param) ->
  (* Rq : pas besoin de pop, le pointeur de pile sera remis au bon endroit 
     grâce aux instructions d'activation *)
    ast_to_tam_expression e
    ^ return taille_ret taille_param
  | AstPlacement.Empty -> ""
  (* Prise en compte des boucles *)
  | AstPlacement.Boucle (ia, b) ->
    begin
      match info_ast_to_info ia with
      | InfoBoucle l -> 
        inverser_liste_boucle ia; (* l a maintenant en premier élément les bons labels 
                                      TODO: vérifier qu'il faut pas reprendre l *)
        let (labLoop, labEndLoop) = List.hd l in 
        supprimer_premier_liste_boucle ia; (* Si deux boucles ont le même nom, on supprime celle utilisée *)
        inverser_liste_boucle ia; (* On remet la liste dans l'ordre: mauvaise complexité, mais liste courte *)
        label labLoop
        ^ ast_to_tam_bloc b
        ^ jump labLoop
        ^ label labEndLoop
      | _ -> raise Exceptions.ErreurInterne
    end
  | AstPlacement.Break s -> jump (s) (* d'où la nécessité de l'avoir déjà avant*)
  | AstPlacement.Continue s -> jump (s) (* idem *)

(* analyse_tds_bloc : tds -> info_ast option -> AstPlacement.bloc -> AstPlacement.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstPlacement.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and ast_to_tam_bloc (l_inst, taille_bloc) =
  List.fold_left (fun prev_str inst -> prev_str ^ ast_to_tam_instruction inst) "" l_inst
  ^ pop 0 taille_bloc

(* analyse_tds_fonction : tds -> AstPlacement.fonction -> AstPlacement.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstPlacement.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec ast_to_tam_fonction (AstPlacement.Fonction(iast,_,l_inst)) =
  (* Rq : On n'autorise pas les fonctions auxillaires *)
  match info_ast_to_info iast with 
  | InfoFun (nom, _, _) -> label nom ^ ast_to_tam_bloc l_inst
  | _ -> raise ErreurInterne
  
(* analyser : AstPlacement.programme -> AstPlacement.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie le bon typage des identifiants et tranforme le programme
en un programme de type AstPlacement.programme *)
(* Erreur si mauvais typage *)
let analyser (AstPlacement.Programme (fonctions,bloc)) = 
  getEntete ()
  (* Analyse des fonctions *)
  ^ List.fold_left (fun prev_str func -> prev_str ^ ast_to_tam_fonction func) "" fonctions
  (* Analyse du bloc *)
  ^ label "main"
  ^ ast_to_tam_bloc bloc
  ^ halt 

