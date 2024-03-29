(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
(* open Tds*)
open Exceptions_non_parametrees
open Ast
open Mtds

type t1 = Ast.AstSyntax.programme
type t2 = Ast.AstTds.programme

(* print_ident : 'a -> 'a 
 * Fonction identitée.
 * Utilisé pour des types simples / primitifs d'identifiants *)
let print_ident s = s

(* chercherGlobalementUnsafeIdent: (string * AstSyntax.Identifiant info) tds -> string -> AstSyntax.identifiant info
 * Utilisation de print_ident pour chercherGlobalementUnsafe *)
let chercherGlobalementUnsafeIdent = chercherGlobalementUnsafe print_ident
(* AbsentLocalementUnsafeIdent: (string * AstSyntax.Identifiant info) tds -> string -> unit
 * Utilisation de print_ident pour AbsentLocalementUnsafe *)
let absentLocalementUnsafeIdent = absentLocalementUnsafe print_ident


(* giveID : unit -> string
 * Génère un identifiant unique.
 * Utilisé lorsqu'une boucle, un break ou un continue sont utilisés sans label.
 * Permet d'associer chacune de ces instructions à un élément dans la TDS
 * De plus, permet de donner un identifiant unique à deux loop ayant le même label, puisque la surcharge est autorisée. *)
let giveID = 
  let num = ref 0 in
  fun () ->
    num := (!num)+1 ;
    "id"^((string_of_int (!num)))

(* analyse_tds_expression : tds -> AstSyntax.expression -> AstTds.expression
 * Paramètre tds : la table des symboles courante
 * Paramètre e : l'expression à analyser
 * Vérifie la bonne utilisation des identifiants et tranforme l'expression
 * en une expression de type AstTds.expression
 * Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e = match e with
  | AstSyntax.Identifiant r ->
    (match r with
      |(s,Neant) ->
        (* gestion des constantes *)
        let info_ast_found = chercherGlobalementUnsafeIdent tds s in
        (
        match info_ast_found with 
          | InfoConst(_,i) -> AstTds.Entier i
          | InfoFun(((f,_),_,_)::_) ->
             raise (MauvaiseUtilisationIdentifiant (print_ident f));
          | InfoVar(_) ->
            AstTds.Identifiant (info_ast_found, Neant)
          | _ -> raise ErreurInterne
        )
      |_ -> AstTds.Identifiant (analyse_tds_identifiant tds r)
    )
  | AstSyntax.Adr a -> 
    (match a with
      |(s,Neant) ->
        (* gestion des constantes *)
        let info_ast_found = chercherGlobalementUnsafeIdent tds s in
        (
        match info_ast_found with 
          | InfoConst(_,_) -> raise RefInterdite
          | _ -> AstTds.Adr (info_ast_found, Neant)
        )
      |_ -> AstTds.Adr (analyse_tds_identifiant tds a)
    )
  | AstSyntax.New t -> AstTds.New t
  | AstSyntax.Entier i -> AstTds.Entier i
  | AstSyntax.Booleen b -> AstTds.Booleen b
  | AstSyntax.Binaire (op, e1, e2) ->
    AstTds.Binaire (op, analyse_tds_expression tds e1, analyse_tds_expression tds e2)
  | AstSyntax.AppelFonction ((f,m), l) ->
    let f_tds = chercherGlobalementUnsafeIdent tds f in
    (* On vérifie qu'on appel bien une fonction *)
    (match f_tds with
      | InfoFun _ -> AstTds.AppelFonction ((f_tds,m),List.map (analyse_tds_expression tds) l)
      | _ -> raise (MauvaiseUtilisationIdentifiant f))
      (* f_tds est une infofun ayant toutes les signatures possibles (surcharge) *)                      
  | AstSyntax.Unaire (op, e) ->
    AstTds.Unaire (op, analyse_tds_expression tds e) 
  | AstSyntax.NULL -> AstTds.NULL
  (* Implémentation des expressions ternaires.*)
  | AstSyntax.Ternaire (e1, e2, e3) -> 
    AstTds.Ternaire (analyse_tds_expression tds e1, analyse_tds_expression tds e2, analyse_tds_expression tds e3)

(* analyse_tds_identifiant: tds -> AstSyntax.Identifiant -> AstTds.Identifiant
 * Paramètre : tds la table des symboles courante
 *             i l'identifiant à analyser, décomposé en un string * Type.mark
 * Vérifie la bonne utilisation des identifiants et tranforme l'identifiant en une identifiant de type AstTds.Identifiant
 * Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_identifiant tds (s,ms) = 
  let info_ast_found = chercherGlobalementUnsafeIdent tds s in
  ( match info_ast_found with 
    | InfoVar(_) | InfoFun(_) -> (info_ast_found, ms)
    | _ -> (raise Exceptions_non_parametrees.RefInterdite))


(* analyse_tds_instruction : tds -> info_ast option -> identifiant info option -> AstSyntax.instruction
 *                          -> int -> string * int list          
 *                          -> AstTds.instruction * (string * int) list * int
 * Paramètres : tds la table des symboles courante
 *              oia None si l'instruction i est dans le bloc principal,
 *                 Some ia où ia est l'information associée à la fonction
 *                 dans laquelle est l'instruction i sinon
 *              optBoucle None si l'instruction i n'est pas dans une boucle,
 *                       Some (id, l) où id est l'identifiant de la boucle
 *                       et l est la liste des étiquettes de la boucle
 *              i l'instruction à analyser
 *              num_inst le numéro de l'instruction dans le bloc courant
 *              ctx le contexte dans lequel est l'instruction i
 * Vérifie la bonne utilisation des identifiants et tranforme l'instruction
 * en une instruction de type AstTds.instruction
 * Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds oia optBoucle i num_inst ctx =
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
            let info = InfoVar ((n,m), ref t, (ref 0), (ref "")) in
            ajouter tds n info;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            ((AstTds.Declaration (t, (info,m), ne), ctx), num_inst+1)
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
            match info with
            | InfoVar((id,mv),t,d,b) ->
              (* Vérification de la bonne utilisation des identifiants dans l'expression *)
              (* et obtention de l'expression transformée *)
              let ne = analyse_tds_expression tds e in
              (* Renvoie de la nouvelle affectation où le nom a été remplacé par l'information
                 et l'expression remplacée par l'expression issue de l'analyse *)
              ((AstTds.Affectation ((InfoVar((id,mv),t,d,b), m), ne), ctx), num_inst+1)
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
          ajouter tds n (InfoConst (n,v));
          (* Suppression du noeud de déclaration des constantes devenu inutile *)
          ((AstTds.Empty, ctx), num_inst+1)
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
      ((AstTds.Affichage (ne), ctx), num_inst+1)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let (tast,nl1) = analyse_tds_bloc tds oia optBoucle t (num_inst+1) (("bloc then", num_inst+1)::ctx) in
      (* Analyse du bloc else *)
      let (east,nl2) = analyse_tds_bloc tds oia optBoucle e (nl1+1) (("bloc else", num_inst+1)::ctx) in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      ((AstTds.Conditionnelle (nc, tast, east), ctx), nl2+1)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let (bast,nl) = analyse_tds_bloc tds oia optBoucle b (num_inst+1) (("bloc tantQue", num_inst+1)::ctx) in
      (* Renvoie la nouvelle structure de la boucle *)
      ((AstTds.TantQue (nc, bast), ctx), nl+1)
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
          ((AstTds.Retour (ne,ia), ctx), num_inst+1)
      end
  (* Boucles à la Rust *)
  | AstSyntax.Boucle(nOpt, li) -> 
    let tdsFille = creerTDSFille tds in
    begin
      match nOpt with
      | None -> (* boucle sans identifiant *)
      (* Création d'un id unique pour la boucle sans id, utilisable depuis l'intérieur de son bloc *)
        let id = giveID () in
        let info = InfoBoucle([id, id^"fin"]) in
        ajouter tdsFille id info;
        let (nli, nl) = analyse_tds_bloc tdsFille oia (Some info) li (num_inst + 1) (("boucle rust", num_inst + 1)::ctx) in
          ((AstTds.Boucle(info, nli), ctx), nl+1)

      | Some n -> (* boucle avec identifiant *)
        begin
          match chercherGlobalement tds n with
          | None -> (* pas de surcharge d'identifiant, donc création d'un nouvel élément dans la TDS *)
            let info = InfoBoucle([n,n^"fin"]) in
            ajouter tdsFille n info;
            let (nli, nl) = analyse_tds_bloc tdsFille oia (Some info) li (num_inst + 1) (("boucle rust", num_inst + 1)::ctx) in
              ((AstTds.Boucle(info, nli), ctx), nl+1)
          | Some r -> ( match r with 
            | InfoBoucle _ -> (* Boucle ayant déjà le même nom -> nécessité d'avoir des labels uniques *)
            let id = giveID () in
             let r' =  ajouter_liste_boucle r id (id^"fin") in
             (*dans tdsfille y a la vieille infoboucle*)
              ajouter tdsFille n r';
              let (nli, nl) = analyse_tds_bloc tdsFille oia (Some r') li (num_inst + 1) (("boucle rust", num_inst + 1)::ctx) in
                ((AstTds.Boucle(r', nli), ctx), nl+1)
            | _ -> raise (DoubleDeclaration n)) (* identifiant déjà utilisé pour autre chose que boucle -> erreur *)
        end
    end
  | AstSyntax.Break nOpt -> 
    begin
      match nOpt with 
      | None -> (* break sans identifiant *)
        begin
          match optBoucle with (* on regarde si on est dans une boucle *)
          | None -> raise BreakHorsBoucle
          | Some ia -> 
            begin
              match ia with
                | InfoBoucle l -> ((AstTds.Break (snd (List.hd (l))), ctx), num_inst+1)
                | _ -> raise ErreurInterne (*optBoucle n'est pas une Infoboucle *)
            end
        end
      | Some n -> (* break avec identifiant *)
        begin
          match chercherGlobalement tds n with 
          | None -> raise (IdentifiantNonDeclare n) 
          | Some r ->
            begin
              match r with 
              | InfoBoucle l -> ((AstTds.Break (snd (List.hd (l))), ctx), num_inst+1)
              | _ -> raise (MauvaiseUtilisationIdentifiant n) (* identifiant utilisé pour autre chose que boucle -> erreur *)
            end
        end
    end
  | AstSyntax.Continue nOpt -> (* Analyse analogue à un break *)
    begin
      match nOpt with 
      | None -> (* continue sans identifiant *)
        begin
          match optBoucle with 
          | None -> raise ContinueHorsBoucle
          | Some ia -> 
            begin
              match ia with
                | InfoBoucle l -> ((AstTds.Continue (fst (List.hd (l))), ctx), num_inst+1)
                | _ -> raise ErreurInterne
            end
        end
      | Some n -> (* continue avec identifiant *)
        begin
          match chercherGlobalement tds n with 
          | None -> raise (IdentifiantNonDeclare n)
          | Some r ->
            begin
              match r with 
              | InfoBoucle l -> ((AstTds.Continue (fst (List.hd (l))), ctx), num_inst+1)
              | _ -> raise (MauvaiseUtilisationIdentifiant n)
            end
        end
    end

(* analyse_tds_bloc : tds -> info_ast option -> AstSyntax.bloc -> AstTds.bloc
 * Paramètres : tds la table des symboles courante
 *              oia None si le bloc li est dans le programme principal,
 *                  Some ia où ia est l'information associée
 *                  à la fonction dans laquelle est le bloc li sinon
 *              optBoucle None si le bloc li n'est pas dans une boucle,
 *                        Some ia où ia est l'information associée
 *                        à la boucle dans laquelle est le bloc li sinon
 *              li liste d'instructions à analyser
 *              nb_lignes numéro de l'instruction en début de bloc
 *              ctx contexte du bloc
 * Vérifie la bonne utilisation des identifiants et tranforme le bloc
 *  en un bloc de type AstTds.bloc
 * Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds oia optBoucle li nb_lignes ctx =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsbloc = creerTDSFille tds in
  let getContext (l_done, line_number) to_get_ctx =
    let (ni, nl) = analyse_tds_instruction tdsbloc oia optBoucle to_get_ctx line_number ctx in
    (l_done@[ni], nl) in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc.
     Cette tds est modifiée par effet de bord *)
  let (nli, nb_lignes) = List.fold_left getContext ([], nb_lignes) li in
  (* afficher_locale tdsbloc ; *) (* décommenter pour afficher la table locale *)
  let complete_context = ((fun nb_l (inst, ctx)  -> (inst, (nb_l,ctx))) nb_lignes) in
  ((List.map complete_context nli), nb_lignes)

(* analyse_tds_fonction : tds -> AstSyntax.fonction -> AstTds.fonction
 * Paramètres : tds la table des symboles courante
 *              f la fonction à analyser
 *              nb_lignes numéro de l'instruction en début de fonction
 * Vérifie la bonne utilisation des identifiants et tranforme la fonction
 * en une fonction de type AstTds.fonction
 * Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds (AstSyntax.Fonction(t,(id,m),l_param,l_inst)) nb_lignes =
  (* prevDeclared : fonction auxillaire permettant de récupérer toutes les fonctions
   * candidates pour gérer la surcharge *)
  let prevDeclared =
    (match chercherGlobalement maintds id with
    (* Infofun -> [((id * mark), typeRetour, [liste_type_params]), autres] *)
      |None -> [] (* Aucune fonction n'existe avec ce nom. *)
      |Some (InfoFun l) ->
        let lp = List.map (fun (_,_,p) -> p) l in
        let getTypexMark = List.map (fun (t, (_,m)) -> (t,m)) in
        (* On vérifie si la fonction n'est pas déjà déclarée. *)
        let fun_compatible params = 
          Type.est_compatible_list (getTypexMark l_param) (getTypexMark params) in
          (* fun_is_found renvoie vrai si une des signatures déjà existantes matche *)
        let fun_is_found = List.fold_left (||) false (List.map fun_compatible lp) in
        if fun_is_found then raise (DoubleDeclaration id) else l
      |Some _ -> raise (DoubleDeclaration id)
    ) in
  
  (* création de la td fille : tds liée au bloc de la fonction *) 
  let tds_fille = creerTDSFille maintds in

  (* Transformation des paramètres en variables dans la fonction *)
  let l_param_tds' =
    List.map (fun (t,(id,m)) -> (id, (InfoVar((id,m), ref t, ref 0, ref  "")))) l_param in

  (* Ajout d'un paramètre a la tds fille *)
  let ajouter_parametre (id, infovar) () =
      absentLocalementUnsafeIdent tds_fille id;
      ajouter tds_fille id infovar; in

  (* ajouter les paramètres dans la tds fille pour l'analyse du bloc
   * on fait attention aux possibles doublons
   * Remarque : ici, choix qu'on peut avoir une variable déclarée dans le bloc englobant et
   * un paramètre de même nom *)
  List.fold_right ajouter_parametre l_param_tds' ();
  
  (* ajout de la fonction dans la tds mère
   * On modifie l'id pour la gestion des labels a la passeCodeRatToTam *)
  let concatParam = fun (tparam,(_,m)) nom -> nom^"@"^(Type.string_of_type_mark (tparam, m)) in
  let idSurcharge = List.fold_right concatParam l_param id in
  ajouter maintds id ((InfoFun (((idSurcharge,m), t, l_param)::prevDeclared)));

  (* liste des ASTTds instructions *)
  let (l_inst_tds, nb) = analyse_tds_bloc tds_fille (Some (InfoFun([(idSurcharge, m),t,l_param]))) None l_inst nb_lignes [(id, 0)] in
  let id_tds = chercherGlobalementUnsafeIdent tds_fille id in
  let get_typexinfo (t, id) = (t, chercherGlobalementUnsafeIdent tds_fille (fst id)) in
  let l' = List.map get_typexinfo l_param in
  
  (AstTds.Fonction(t, id_tds, l', l_inst_tds),nb)

(* analyser : AstSyntax.programme -> AstTds.programme
 * Paramètre : le programme à analyser
 * Vérifie la bonne utilisation des identifiants et tranforme le programme
 * en un programme de type AstTds.programme
 * Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme (fonctions,prog)) =
  let tds = creerTDSMere () in
  let getContext (l_done, line_number) to_get_ctx =
    let (nf, nl) = analyse_tds_fonction tds to_get_ctx line_number in (l_done@[nf], nl) in
  let (nf, nl) = List.fold_left getContext ([], 1) fonctions in
  (* Récupération du numéro de la dernière ligne issue de l'analyse des fonctions *)
  let (nb, _) = analyse_tds_bloc tds None None prog (nl + 1) [("main", nl)] in
  AstTds.Programme (nf,nb)
