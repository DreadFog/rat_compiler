(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
(* open Tds*)
open Exceptions_identifiants
open Ast
open Mtds

type t1 = Ast.AstSyntax.programme
type t2 = Ast.AstTds.programme
  
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

(*let rec print_ident (r:AstSyntax.identifiant) = (match r with
  |Identifiant(s,Neant) -> s
  |Identifiant(s,Pointeur(p)) -> "*"^(print_ident (Identifiant(s,p))))*)
let print_ident s = s

let chercherGlobalementUnsafeIdent = chercherGlobalementUnsafe print_ident

let absentLocalementUnsafeIdent = absentLocalementUnsafe print_ident

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

(* analyse_tds_expression : tds -> AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e = match e with
  | AstSyntax.Identifiant r ->
    (match r with
      |(s,Neant) ->
        (* gestion des constantes *)
        let info_ast_found = chercherGlobalementUnsafeIdent tds s in
        (
        match (info_ast_to_info info_ast_found) with 
          | InfoConst(_,i) -> AstTds.Entier i
          | InfoFun((f,(_: Type.mark)), _, _) ->
             raise (MauvaiseUtilisationIdentifiant (print_ident f));
          | InfoVar(_) ->
            AstTds.Identifiant (Neant, info_ast_found)
        )
      |_ -> let (m,iast) = analyse_tds_identifiant tds r in
          AstTds.Identifiant (m,iast)
    )
  | AstSyntax.Adr a -> 
    (match a with
      |(s,Neant) ->
        (* gestion des constantes *)
        let info_ast_found = chercherGlobalementUnsafeIdent tds s in
        (
        match (info_ast_to_info info_ast_found) with 
          | InfoConst(_,_) -> raise RefInterdite
          | _ -> AstTds.Adr (Neant, info_ast_found)
        )
      |_ -> let (m,iast) = analyse_tds_identifiant tds a in
          AstTds.Adr (m, iast)
    )
  | AstSyntax.New t -> AstTds.New t
  | AstSyntax.Entier i -> AstTds.Entier i
  | AstSyntax.Booleen b -> AstTds.Booleen b
  | AstSyntax.Binaire (op, e1, e2) ->
    AstTds.Binaire (op, analyse_tds_expression tds e1, analyse_tds_expression tds e2)
  | AstSyntax.AppelFonction ((f,_), l) ->
    let f_tds = chercherGlobalementUnsafeIdent tds f in
    (* On vérifie qu'on appel bien une fonction *)
    (match info_ast_to_info f_tds with
      InfoFun(_,_,_) -> AstTds.AppelFonction ( f_tds
                                , List.map (analyse_tds_expression tds) l)
      |_ -> raise (MauvaiseUtilisationIdentifiant (print_ident f)));
  | AstSyntax.Unaire (op, e) ->
    AstTds.Unaire (op, analyse_tds_expression tds e) 
  | AstSyntax.NULL -> AstTds.NULL

and analyse_tds_identifiant tds ((s,ms)) = 
  let info_ast_found = chercherGlobalementUnsafeIdent tds s in
  (
  match (info_ast_to_info info_ast_found) with 
    | InfoConst(_,_) -> (raise Exceptions_identifiants.RefInterdite)
    | InfoVar((_,m),_,_,_)-> (gestion_pointeurs m ms, info_ast_found)
    | InfoFun((_,m),_,_) -> (gestion_pointeurs m ms, info_ast_found)
  )

  (* analyse_tds_instruction : tds -> AstSyntax.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction *)


(* analyse_tds_instruction : tds -> info_ast option -> AstSyntax.instruction
                                    -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction
                   dans laquelle est l'instruction i sinon *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds oia i =
  match i with
  | AstSyntax.Declaration (t, (n,m), e) ->
      begin
        match chercherLocalement tds n with
        | None ->
            (* L'identifiant n'est pas trouvé dans la tds locale,
            il n'a donc pas été déclaré dans le bloc courant *)
            (* Vérification de la bonne utilisation des identifiants dans l'expression *)
            (* et obtention de l'expression transformée *)
            let ne = analyse_tds_expression tds e in
            (* Création de l'information associée à l'identfiant *)
            let info = InfoVar ((n,m), t, 0, "") in
            (* Création du pointeur sur l'information *)
            let ia = info_to_info_ast info in
            ajouter tds n ia;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            AstTds.Declaration (t, ia, ne)
        | Some _ ->
            (* L'identifiant est trouvé dans la tds locale,
            il a donc déjà été déclaré dans le bloc courant *)
            raise (DoubleDeclaration (print_ident n))
      end
  | AstSyntax.Affectation ((n,m),e) ->
      begin
        match chercherGlobalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds globale. *)
          
          raise (IdentifiantNonDeclare (print_ident n))
        | Some info ->
          (* L'identifiant est trouvé dans la tds globale,
          il a donc déjà été déclaré. L'information associée est récupérée. *)
          begin
            match info_ast_to_info info with
            | InfoVar((_,mv),_,_,_) ->
              (* Vérification de la bonne utilisation des identifiants dans l'expression *)
              (* et obtention de l'expression transformée *)
              let ne = analyse_tds_expression tds e in
              (* Renvoie de la nouvelle affectation où le nom a été remplacé par l'information
                 et l'expression remplacée par l'expression issue de l'analyse *)
              AstTds.Affectation (gestion_pointeurs mv m, info, ne)
            |  _ ->
              (* Modification d'une constante ou d'une fonction *)
              raise (MauvaiseUtilisationIdentifiant (print_ident n))
          end
      end
  | AstSyntax.Constante ((n,Neant),v) ->
      begin
        match chercherLocalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds locale,
             il n'a donc pas été déclaré dans le bloc courant *)
          (* Ajout dans la tds de la constante *)
          ajouter tds n (info_to_info_ast (InfoConst (n,v)));
          (* Suppression du noeud de déclaration des constantes devenu inutile *)
          AstTds.Empty
        | Some _ ->
          (* L'identifiant est trouvé dans la tds locale,
          il a donc déjà été déclaré dans le bloc courant *)
          raise (DoubleDeclaration (print_ident n))
      end
  | AstSyntax.Constante(_) -> raise ErreurInterne
  | AstSyntax.Affichage e ->
      (* Vérification de la bonne utilisation des identifiants dans l'expression *)
      (* et obtention de l'expression transformée *)
      let ne = analyse_tds_expression tds e in
      (* Renvoie du nouvel affichage où l'expression remplacée par
        l'expression issue de l'analyse *)
      AstTds.Affichage (ne)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let tast = analyse_tds_bloc tds oia t in
      (* Analyse du bloc else *)
      let east = analyse_tds_bloc tds oia e in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      AstTds.Conditionnelle (nc, tast, east)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let bast = analyse_tds_bloc tds oia b in
      (* Renvoie la nouvelle structure de la boucle *)
      AstTds.TantQue (nc, bast)
  | AstSyntax.Retour (e) ->
      begin
      (* On récupère l'information associée à la fonction à laquelle le return est associée *)
      match oia with
        (* Il n'y a pas d'information -> l'instruction est dans le bloc principal : erreur *)
      | None -> raise RetourDansMain
        (* Il y a une information -> l'instruction est dans une fonction *)
      | Some ia ->
        (* Analyse de l'expression *)
        let ne = analyse_tds_expression tds e in
        AstTds.Retour (ne,ia)
      end


(* analyse_tds_bloc : tds -> info_ast option -> AstSyntax.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée
                    à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc
   en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds oia li =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsbloc = creerTDSFille tds in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc.
     Cette tds est modifiée par effet de bord *)
   let nli = List.map (analyse_tds_instruction tdsbloc oia) li in
   (* afficher_locale tdsbloc ; *) (* décommenter pour afficher la table locale *)
   nli

(* analyse_tds_fonction : tds -> AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds (AstSyntax.Fonction(t,(id,m),l_param,l_inst)) =
  (* On vérifie que la fonction n'est pas déjà déclarée *)
  absentLocalementUnsafeIdent maintds id;
  (* création de la td fille : tds liée au bloc de la fonction *) 
  let tds_fille = creerTDSFille maintds in

  let l_param_tds' =
    List.map (fun (t,s) -> ((t,s), info_to_info_ast (InfoVar(s,t,0,"")))) l_param in
  
  let (getSeconds:(('a*'b) * 'c) list -> ('b * 'c) list)
    = List.map (fun (c,iast') -> (snd c, iast')) in
  let (getFirsts:(('d*'e) * 'f) list -> ('d * 'f) list)
    = List.map (fun (c,iast') -> (fst c, iast')) in
  (* ajouter les paramètres dans la tds fille pour l'analyse du bloc
   * on fait attention aux possibles doublons
   * Remarque : ici, choix qu'on peut avoir une variable déclarée dans le bloc englobant et
   * un paramètre de même nom *)
  List.fold_right (fun curr () -> absentLocalementUnsafeIdent tds_fille (fst curr);
                                  ajouter tds_fille (fst curr) (snd curr))
                  (getFirsts (getSeconds l_param_tds')) ();

  (* ajout de la fonction dans la tds mère *)
  (* On conserve aussi l'identifiant bien que ça ne soit pas nécessaire *)
  ajouter maintds id (info_to_info_ast (InfoFun ((id,m), t, l_param)));

  let (getFirsts:(('z*'x) * 'y) list -> ('z * 'y) list)
    = List.map (fun (c,iast') -> (fst c, iast')) in
  (* liste des ASTTds instructions *)
  let l_inst_tds = analyse_tds_bloc tds_fille (chercherGlobalement tds_fille id) l_inst in
  let id_tds = chercherGlobalementUnsafeIdent tds_fille id in
  let (l:(Type.typ * AstTds.tds_info_ast) list) = getFirsts l_param_tds' in
  AstTds.Fonction(t, id_tds, l, l_inst_tds)


(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme (fonctions,prog)) =
  let tds = creerTDSMere () in
  let nf = List.map (analyse_tds_fonction tds) fonctions in
  let nb = analyse_tds_bloc tds None prog in
  AstTds.Programme (nf,nb)
