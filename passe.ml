(* Interface définissant une passe *)
module type Passe =
sig 
  (* type des AST en entrée de la passe *)
  type t1
  (* type des AST en sortie de la passe *)
  type t2

  (* fonction d'analyse qui tranforme un AST de type t1 
  en un AST de type t2 en réalisant des vérifications *)
  val analyser : t1 -> t2
end

(* Passe AstSyntax.programme -> AstTds.programme *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PasseTdsNop : Passe  with type t1 = Ast.AstSyntax.programme and type t2 =  Ast.AstTds.programme =
struct
  type t1 = Ast.AstSyntax.programme
  type t2 = Ast.AstTds.programme

  let analyser _ =  Ast.AstTds.Programme([],[])

end

(* Passe AstTds.programme -> AstType.programme *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PasseTypeNop : Passe  with type t1 = Ast.AstTds.programme and type t2 = Ast.AstType.programme =
struct
  type t1 = Ast.AstTds.programme
  type t2 =  Ast.AstType.programme

  let analyser _ =  Ast.AstType.Programme([],[])

end

(* Passe AstType.programme -> unit *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PassePlacementNop : Passe  with type t1 =  Ast.AstType.programme and type t2 = Ast.AstPlacement.programme =
struct
  type t1 = Ast.AstType.programme
  type t2 = Ast.AstPlacement.programme

  let analyser _ = Ast.AstPlacement.Programme([],([],0))

end

(* Passe AstPlacement.programme -> string *)
(* Ne fait rien *)
(* Nécessaire aux compilateurs intermédiaires (non complets) *)
module PasseCodeNop : Passe  with type t1 = Ast.AstPlacement.programme and type t2 = string =
struct
  type t1 = Ast.AstPlacement.programme
  type t2 = string

  let analyser _ = ""

end

(* Passe AstPlacement.programme -> string *)
(* Affiche les adresses des variables  *)
(* Pour tester les paramètres des fonctions, il est nécessaire de les mettre en retour *)

module VerifPlacement =
struct
  open Mtds

  (* Renvoie l'adresse d'une variable dans le cas d'une déclaration *)
  let rec analyser_instruction i = 
    match i with
    | Ast.AstPlacement.Declaration (info,_) -> 
      begin
        match info with
        | InfoVar (n,_,d,r) -> [(fst n,(!d,!r))]
        | _ -> []
        end
    | Ast.AstPlacement.Conditionnelle(_,(bt,_),(be,_)) ->
        (List.flatten (List.map (analyser_instruction) (List.map fst bt)))
      @ (List.flatten (List.map (analyser_instruction) (List.map fst be)))
    | Ast.AstPlacement.TantQue (_,(b,_)) ->
        (List.flatten (List.map (analyser_instruction) (List.map fst b)))
    | _ -> [] 


let analyser_param info =
  match info with
  | InfoVar (n,_,d,r) -> [(fst n,(!d,!r))]
  | _ -> []

  (* Renvoie la suite des adresses des variables déclarées dans la fonction *)
  (* Ainsi qu'une adresse d'identifiant si le retour est un identifiant *)
  let analyser_fonction (Ast.AstPlacement.Fonction(info,lp,(li,_))) =
    (*La liste des paramètres n'est plus présente, pour tester le placement des paramètres, on utilisera une astuce :
    il faudra écrire un programme qui renvoie le paramètre *)
    match info with
    | InfoFun([n,_,_]) -> [(fst n, 
                          (List.flatten (List.map analyser_param lp))
                        @ (List.flatten (List.map (analyser_instruction) (List.map fst li)))
                      )]
    | _ -> failwith "Internal error"

  (* Renvoie la suite des adresses des variables déclarées dans les fonctions et dans le programme principal *)
  let analyser (Ast.AstPlacement.Programme (fonctions, (prog,_))) =
      ("main", List.flatten (List.map (analyser_instruction) (List.map fst prog)))
    ::(List.flatten (List.map (analyser_fonction) fonctions))

end
