(* Module de la passe de génération de code *)
(* doit être conforme à l'interface Passe *)
open Mtds
open Exceptions_non_parametrees
open Ast
open Tam
open Code

type t1 = Ast.AstPlacement.programme
type t2 = string

(* tam_var_of_info_ast : ('a * Type.mark) info -> Type.mark * int * int ref * string ref
 * Paramètre : iast, l'info ast associé à la variable tam
 * Retourne : les infos d'une info_ast *)
let tam_var_of_info_ast iast =
  match iast with
    InfoVar((_,m),ty,dep,reg) -> (m, Type.getTaille (!ty,m), dep, reg)
    |_ -> raise ErreurInterne


(* assignPtr: unit -> string
 * Retourne : le code TAM pour assigner une valeur à un pointeur *)
let assignPtr =
    "LOAD (1) -1[ST]\n"   (* loadl la taille du ptr : 1 *)
  ^ "LOAD (1) -3[ST]\n"   (* load  l'@ dest copie *)
  ^ "STOREI (1)\n"        (* load  l'@ source copie *)


(* ast_to_tam_expression : AstType.expression -> string
 * Paramètre e : l'expression à analyser
 * Renvoie le code TAM correspondant à l'expression *)
let rec ast_to_tam_expression e = match e with
  | AstType.Identifiant (s,_) ->
        let (m, taille, depl, reg) = tam_var_of_info_ast s in 
        (* int *** a = ...; ...; b = **a *)
        let rec gestion_ptr p = (match p with
          Type.Neant -> ""
          |Type.Pointeur(Type.Neant) ->
            (* mettre l'expression dans le tas *)
              loadi taille
          |Type.Pointeur p' ->
            (* On load l'adresse vers laquelle pointe p' dans la pile
            * puis on la copie dans le tas avant de la pop *) 
              loadi 1 (* load l'@ vers laquelle pointe p' *)
            ^ gestion_ptr p')
        in 
        load taille !depl !reg
      ^ gestion_ptr m
  | AstType.NULL -> subr "MVoid"
  | AstType.New _ -> loadl_int 4242 (* déjà géré dans déclaration *)
  | AstType.Adr (a,_) ->
      let (_, _, depl, reg) = tam_var_of_info_ast a in
      loada !depl !reg
  | AstType.Entier i -> loadl_int i 
  | AstType.Booleen b -> loadl_int (Bool.to_int b)
  | AstType.Binaire (op, e1, e2) -> 
    let ne1 = ast_to_tam_expression e1
    and ne2 = ast_to_tam_expression e2 in
    ne1 ^ ne2 ^ (
      match op with
      | Fraction -> "" (* les deux entiers sont déjà dans l'ordre d'un rationnel *)
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
       *   si on désire le numérateur, on pop 1 pour avoir ST au bon endroit
       *   si on désire le dénominateur, on déplace celui-ci en -2 ST et on pop 1) *)
      | Numerateur -> pop 0 1
      | Denominateur -> store 1 (-2) "ST" 
    )
  | AstType.AppelFonction (f, l) ->
    (match f with
    | (InfoFun ((name,_), _),_) ->
      List.fold_left (fun acc e -> acc ^ ast_to_tam_expression e) "" l
      ^ call "ST" name
    | _ -> raise ErreurInterne 
    )
  (* Gestion des expressions ternaires:
   * Similaire à un if / else, un jump est réalisé conditionnellement sur la valeur de la première expression *)
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


(* ast_to_tam_instruction : AstType.instruction -> string
 * Paramètre i : l'instruction à analyser
 * Renvoie le code TAM correspondant à l'instruction *)
let rec ast_to_tam_instruction i =
  match i with
  | AstPlacement.Declaration (iast, e) ->
    let (ty, m, taille, dep, reg) = 
      match iast with
        InfoVar((_,m),ty,dep,reg) -> (ty, m, Type.getTaille (!ty,m),dep,reg)
        |_ -> raise ErreurInterne
    in
      (match m with
        Type.Neant -> 
            push taille
          ^ ast_to_tam_expression e
          ^ store taille !dep !reg
        (* Pour les pointeurs on a dans la pile l'adr du 1er *
         * le reste est dans le tas *)
        | Type.Pointeur p ->
          (* int **a; pile : @( *a ) tas : *a et a *)
          let rec gestion_ptr p = match p with
            Type.Neant ->
              (* mettre l'expression dans le tas *)
                ast_to_tam_expression e
              ^ loada (-(1+taille)) "ST"
              ^ storei taille
            |Type.Pointeur p' ->
              (* On alloue et load en haut de pile
               * l'adresse vers laquelle pointe p dans la pile
               * puis on la copie dans le tas avant de la pop *) 
               loadl_int (Type.getTaille (!ty,p'))
              ^ subr "MAlloc" (* @Source copie, futur @Dest *)
              ^ assignPtr
              ^ gestion_ptr p'
              ^ pop 0 1 (* pop du MAlloc qui est maintenant dans le tas *)
          in 
        (* int * -> MAlloc taille(int) mais int ** -> MAlloc taille( int* ) *)
          (loadl_int (Type.getTaille (!ty,p)))
        ^ (subr "MAlloc") (* 1ère @Source pour la copie *)
        ^ gestion_ptr p
      )
  | AstPlacement.Affectation ((iast,m), e) ->
    let (taille, dep, reg) = (
      match iast with
        InfoVar((_,_),ty,dep,reg) -> (Type.getTaille (!ty,m),dep,reg)
        |_ -> raise ErreurInterne) in
    (match m with
      Neant -> 
          ast_to_tam_expression e
        ^ store taille !dep !reg
      |Pointeur _ ->
        let rec gestion_ptr p = match p with
          Type.Neant -> raise ErreurInterne
          |Type.Pointeur(Type.Neant) ->
            (* mettre l'expression dans le tas *)
              ast_to_tam_expression e
            ^ load 1 (-2) "ST"
            ^ storei taille
            ^ pop 0 taille
          |Type.Pointeur p' ->
            (* On load l'adresse vers laquelle pointe p' dans la pile
             * puis on la copie dans le tas avant de la pop *) 
              loadi 1 (* load l'@ vers laquelle pointe p' *)
            ^ gestion_ptr p'
            ^ pop 0 1 (* pop, on a plus besoin des @ pointées *)
        in
          push 1
        ^ load taille !dep !reg
        ^ gestion_ptr m )
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
   *      grâce aux instructions d'activation *)
      ast_to_tam_expression e
    ^ return taille_ret taille_param
  | AstPlacement.Empty -> ""
  (* Prise en compte des boucles *)
  | AstPlacement.Boucle (ia, b) ->
    begin
      match ia with
      | InfoBoucle l -> 
        (*let l' = inverser_liste_boucle ia in (* l a maintenant en premier élément les bons labels 
                                      TODO: vérifier qu'il faut pas reprendre l *)*)

        let (labLoop, labEndLoop) = List.hd l in 
        (* TODO: supprimer ces commentaires quand Nathan m'aura expliqué pourquoi ça marchait pas lol *)
        (*supprimer_premier_liste_boucle ia; (* Si deux boucles ont le même nom, on supprime celle utilisée *)
        inverser_liste_boucle ia; (* On remet la liste dans l'ordre: mauvaise complexité, mais liste courte *)*)
        label labLoop
        ^ ast_to_tam_bloc b
        ^ jump labLoop
        ^ label labEndLoop
      | _ -> raise ErreurInterne
    end
  | AstPlacement.Break s -> 
    jump s (* Grâce à la passe TDS et l'association des bons labels, cette passe est élémentaire *)
  | AstPlacement.Continue s -> 
    jump s (* idem *)

(* ast_to_tam_bloc : AstPlacement.bloc -> string
 * Paramètre : le bloc à analyser ainsi que sa taille mémoire
 * Transforme le bloc en code TAM *)
and ast_to_tam_bloc (l_inst, taille_bloc) =
    List.fold_left (fun prev_str inst -> prev_str ^ ast_to_tam_instruction inst)
                    "" (List.map fst l_inst (* contexte inutile ici *))
  ^ pop 0 taille_bloc

(* ast_to_tam_fonction : AstPlacement.fonction -> string
 * Paramètre : la fonction à analyser
 * Transforme la fonction en code TAM *)
let ast_to_tam_fonction (AstPlacement.Fonction(iast,_,l_inst)) =
  (* Rq : On n'autorise pas les fonctions auxillaires *)
  match iast with 
  | InfoFun ((nom,_), _) -> label nom ^ ast_to_tam_bloc l_inst
  | _ -> raise ErreurInterne
  
(* analyser : AstPlacement.programme -> string
  * Paramètre : le programme à analyser
  * Transforme le programme en code TAM *)
let analyser (AstPlacement.Programme (fonctions,bloc)) = 
    getEntete ()
  (* Analyse des fonctions *)
  ^ List.fold_left (fun prev_str func -> prev_str ^ ast_to_tam_fonction func)
                    "" fonctions
  (* Analyse du bloc *)
  ^ label "main"
  ^ ast_to_tam_bloc bloc
  ^ halt 

