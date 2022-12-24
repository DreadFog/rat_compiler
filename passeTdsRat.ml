(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions_identifiants
open Ast

type t1 = Ast.AstSyntax.programme
type t2 = Ast.AstTds.programme

(* Anticipation: mise d'un identifiant aux boucles sans identifiant *)
let giveID = 
  let num = ref 0 in
  fun () ->
    num := (!num)+1 ;
    "id"^((string_of_int (!num)))




(* analyse_tds_expression : tds -> AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e = match e with
  | AstSyntax.Ident s ->
    (* vérification qu'on utilise pas un nom de fonction *)
    let info_ast_found = Tds.chercherGlobalementUnsafe tds s in
    (
    match (info_ast_to_info info_ast_found) with 
      | InfoFun(f, _, _) ->
          raise (Exceptions_identifiants.MauvaiseUtilisationIdentifiant f);
      | InfoConst(_,i) -> AstTds.Entier i
      | _ -> AstTds.Ident (info_ast_found)
    )
  | AstSyntax.Entier i -> AstTds.Entier i
  | AstSyntax.Booleen b -> AstTds.Booleen b
  | AstSyntax.Binaire (op, e1, e2) ->
    AstTds.Binaire (op, analyse_tds_expression tds e1, analyse_tds_expression tds e2)
  | AstSyntax.AppelFonction (f, l) ->
    let f_tds = Tds.chercherGlobalementUnsafe tds f in
    (* On vérifie qu'on appel bien une fonction *)
    (match info_ast_to_info f_tds with
      InfoFun(_,_,_) -> AstTds.AppelFonction ( f_tds
                                , List.map (analyse_tds_expression tds) l)
      |_ -> raise (Exceptions_identifiants.MauvaiseUtilisationIdentifiant f));

  | AstSyntax.Unaire (op, e) ->
    AstTds.Unaire (op, analyse_tds_expression tds e) 
  | AstSyntax.Ternaire (e1, e2, e3) -> 
    AstTds.Ternaire (analyse_tds_expression tds e1, analyse_tds_expression tds e2, analyse_tds_expression tds e3)
  

(* analyse_tds_instruction : tds -> AstSyntax.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction *)


(* analyse_tds_instruction : tds -> info_ast option -> AstSyntax.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre iaOptBoucle: L'info_ast option associé à la boucle courante.*)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds oia iaOptBoucle i num_l contexte =
  match i with
  | AstSyntax.Declaration (t, n, e) ->
      begin
        match chercherLocalement tds n with
        | None ->
            (* L'identifiant n'est pas trouvé dans la tds locale,
            il n'a donc pas été déclaré dans le bloc courant *)
            (* Vérification de la bonne utilisation des identifiants dans l'expression *)
            (* et obtention de l'expression transformée *)
            let ne = analyse_tds_expression tds e in
            (* Création de l'information associée à l'identfiant *)
            let info = InfoVar (n,Undefined, 0, "") in
            (* Création du pointeur sur l'information *)
            let ia = info_to_info_ast info in
            (* Ajout de l'information (pointeur) dans la tds *)
            ajouter tds n ia;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            (AstTds.Declaration (t, ia, ne, (num_l, contexte)),num_l + 1)
        | Some _ ->
            (* L'identifiant est trouvé dans la tds locale,
            il a donc déjà été déclaré dans le bloc courant *)
            raise (DoubleDeclaration n)
      end
  | AstSyntax.Affectation (n,e) ->
      begin
        match chercherGlobalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds globale. *)
          raise (IdentifiantNonDeclare n)
        | Some info ->
          (* L'identifiant est trouvé dans la tds globale,
          il a donc déjà été déclaré. L'information associée est récupérée. *)
          begin
            match info_ast_to_info info with
            | InfoVar _ ->
              (* Vérification de la bonne utilisation des identifiants dans l'expression *)
              (* et obtention de l'expression transformée *)
              let ne = analyse_tds_expression tds e in
              (* Renvoie de la nouvelle affectation où le nom a été remplacé par l'information
                 et l'expression remplacée par l'expression issue de l'analyse *)
              (AstTds.Affectation (info, ne, (num_l, contexte)),num_l + 1)
            |  _ ->
              (* Modification d'une constante ou d'une fonction *)
              raise (MauvaiseUtilisationIdentifiant n)
          end
      end
  | AstSyntax.Constante (n,v) ->
      begin
        match chercherLocalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds locale,
             il n'a donc pas été déclaré dans le bloc courant *)
          (* Ajout dans la tds de la constante *)
          ajouter tds n (info_to_info_ast (InfoConst (n,v)));
          (* Suppression du noeud de déclaration des constantes devenu inutile *)
          (AstTds.Empty,num_l + 1)
        | Some _ ->
          (* L'identifiant est trouvé dans la tds locale,
          il a donc déjà été déclaré dans le bloc courant *)
          raise (DoubleDeclaration n)
      end
  | AstSyntax.Affichage e ->
      (* Vérification de la bonne utilisation des identifiants dans l'expression *)
      (* et obtention de l'expression transformée *)
      let ne = analyse_tds_expression tds e in
      (* Renvoie du nouvel affichage où l'expression remplacée par l'expression issue de l'analyse *)
      (AstTds.Affichage (ne, (num_l, contexte)),num_l + 1)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let (tast, nl1) = analyse_tds_bloc tds oia iaOptBoucle t (num_l+1) (("bloc then", num_l+1)::contexte) in 
      (* Analyse du bloc else *)
      let (east, nl2) = analyse_tds_bloc tds oia iaOptBoucle e (nl1+1) (("bloc else",nl1+1)::contexte) in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      (AstTds.Conditionnelle (nc, tast, east, (num_l, contexte)), nl2 + 1)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let (bast, nl) = analyse_tds_bloc tds oia iaOptBoucle b (num_l + 1) (("bloc tantQue", num_l + 1)::contexte) in
      (* Renvoie la nouvelle structure de la boucle *)
      (AstTds.TantQue (nc, bast, (num_l, contexte)), nl + 1)
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
        (AstTds.Retour (ne,ia, (num_l, contexte)), num_l + 1)
      end

  (*Boucles à la Rust*)
  | AstSyntax.Boucle(nOpt, li) -> 
    begin
      match nOpt with
      | None -> (* boucle sans identifiant *)
        let id = giveID () in
        let info = InfoBoucle([id, id^"fin"]) in
        let ia = info_to_info_ast info in
        ajouter tds id ia;
        let (nli, n_l) = analyse_tds_bloc tds oia (Some ia) li (num_l + 1) (("boucle rust", num_l + 1)::contexte)in
        (AstTds.Boucle(ia, nli, (num_l, contexte)), n_l + 1)

      | Some n -> (* boucle avec identifiant *)
        begin
          match chercherGlobalement tds n with
          | None -> 
            let info = InfoBoucle([n,n^"fin"]) in
            let ia = info_to_info_ast info in
            ajouter tds n ia;
            let (nli, n_l) = analyse_tds_bloc tds oia (Some ia) li (num_l + 1) (("boucle rust", num_l + 1)::contexte)in
            (AstTds.Boucle(ia, nli, (num_l, contexte)), n_l + 1)
          | Some r -> ( match info_ast_to_info r with 
            | InfoBoucle _ -> (* Boucle ayant déjà le même nom -> nécessité d'avoir des labels uniques *)
            let id = giveID () in
              Tds.ajouter_liste_boucle r id (id^"fin");
              let (nli, n_l) = analyse_tds_bloc tds oia (Some r) li (num_l + 1) (("boucle rust", num_l + 1)::contexte)in
              (AstTds.Boucle(r, nli, (num_l, contexte)), n_l + 1)
            | _ -> raise (DoubleDeclaration n))
        end
    end
  | AstSyntax.Break nOpt -> 
    begin
      match nOpt with 
      | None -> (* break sans identifiant *)
        begin
          match iaOptBoucle with 
          | None -> raise BreakHorsBoucle
          | Some ia -> 
            begin
              match info_ast_to_info ia with
                | InfoBoucle l -> (AstTds.Break (snd (List.hd l), (num_l, contexte)), num_l + 1)
                | _ -> raise ErreurInterne
            end
        end

      | Some(n) -> (* break avec identifiant *)
        begin
          match chercherGlobalement tds n with 
          | None -> raise (IdentifiantNonDeclare n)
          | Some (r) ->
            begin
              match info_ast_to_info r with 
              | InfoBoucle l -> (AstTds.Break (snd (List.hd l), (num_l, contexte)), num_l + 1)
              | _ -> raise (MauvaiseUtilisationIdentifiant n)
            end
        end
    end
  | AstSyntax.Continue nOpt -> 
    begin
      match nOpt with 
      | None -> (* continue sans identifiant *)
        begin
          match iaOptBoucle with 
          | None -> raise ContinueHorsBoucle
          | Some ia -> 
            begin
              match info_ast_to_info ia with
                | InfoBoucle l -> (AstTds.Continue (fst (List.hd l), (num_l, contexte)), num_l + 1)
                | _ -> raise ErreurInterne
            end
        end

      | Some(n) -> (* continue avec identifiant *)
        begin
          match chercherGlobalement tds n with 
          | None -> raise (IdentifiantNonDeclare n)
          | Some (r) ->
            begin
              match info_ast_to_info r with 
              | InfoBoucle l -> (AstTds.Continue (fst (List.hd l), (num_l, contexte)), num_l + 1)
              | _ -> raise (MauvaiseUtilisationIdentifiant n)
            end
        end
    end




(* analyse_tds_bloc : tds -> info_ast option -> AstSyntax.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds oia iaOptBoucle li nb_l contexte =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsbloc = creerTDSFille tds in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc.
     Cette tds est modifiée par effet de bord *)
   let fonction_fold_left (liste_traitee, acc_l) i_c = 
    let (ni, nl) = analyse_tds_instruction tdsbloc oia iaOptBoucle i_c acc_l contexte in
    (liste_traitee@[ni], nl) in
    let (nli, nb_lignes) = List.fold_left fonction_fold_left ([], nb_l) li in
   (* afficher_locale tdsbloc ; *) (* décommenter pour afficher la table locale *)
   (nli, nb_lignes)


   
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

(* analyse_tds_fonction : tds -> AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds (AstSyntax.Fonction(t,nom,l_param,l_inst)) nb_ligne =
  (* On vérifie que la fonction n'est pas déjà déclarée *)
  Tds.absentLocalementUnsafe maintds nom;
  (* création de la td fille : tds liée au bloc de la fonction *) 
  let tds_fille = creerTDSFille maintds in

  let l_param_tds' =
    List.map (fun (t,s) -> ((t,s), info_to_info_ast (InfoVar(s,t,0,"")))) l_param in
  
  let getSeconds = List.map (fun (c,iast') -> (snd c, iast'))
  and getFirsts = List.map (fun (c,iast') -> (fst c, iast')) in
  (* ajouter les paramètres dans la tds fille pour l'analyse du bloc
   * on fait attention aux possibles doublons
   * Remarque : ici, choix qu'on peut avoir une variable déclarée dans le bloc englobant et
   * un paramètre de même nom *)
  List.fold_right (fun curr () -> Tds.absentLocalementUnsafe tds_fille (fst curr);
                                  ajouter tds_fille (fst curr) (snd curr))
                  (getSeconds l_param_tds') ();

  (* ajout de la fonction dans la tds mère *)
  ajouter maintds nom (info_to_info_ast (InfoFun (nom, t, List.map fst l_param)));

  (* liste des ASTTds instructions *)
  let (l_inst_tds, nb) = analyse_tds_bloc tds_fille (chercherGlobalement tds_fille nom) None l_inst nb_ligne [(nom, 0)] in
  let nom_tds = chercherGlobalementUnsafe tds_fille nom in
  (AstTds.Fonction(t, nom_tds, (getFirsts l_param_tds'), l_inst_tds), nb)


(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme (fonctions,prog)) =
  let tds = creerTDSMere () in
  let fold_function (prev_funs, acc_l) curr_fun = 
    let (nf, nl) = analyse_tds_fonction tds curr_fun acc_l in
      (prev_funs@[nf], nl) in
  let (nf, nl) = List.fold_left fold_function ([], 0) fonctions in
  let (nb, _) = analyse_tds_bloc tds None None prog (nl + 1) [("main", nl + 1)] in
  AstTds.Programme (nf,nb)
