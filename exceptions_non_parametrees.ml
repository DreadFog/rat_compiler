(* Ce fichier permet de casser une interdépendance entre le module type et les autres *)


(* DoubleDeclaration : Exceptions pour la gestion des identificateurs *)
exception DoubleDeclaration of string

(* IdentifiantNonDeclare : Exception levée lors de l'utilisation d'une variable non déclarée *) 
exception IdentifiantNonDeclare of string 

(* MauvaiseUtilisationIdentifiant : Remarque une utilisation d'identifiant incorrect
 * par ex, call une constante ou modifier une constante. *)
exception MauvaiseUtilisationIdentifiant of string 

(* RetourDansMain : Utilisation illégale de return dans le programme principal *)
exception RetourDansMain

(* ErreurInterne : Exception ne se produisant qu'en cas d'erreur de logique interne au compilateur,
 * et non à cause d'une erreur du fichier d'entrée.*)
exception ErreurInterne

(* BreakHorsBoucle: Exception survenant lors de l'utilisation d'un break hors du contexte d'une boucle.*)
exception BreakHorsBoucle

(* ContinueHorsBoucle: Exception survenant lors de l'utilisation d'un continue hors du contexte d'une boucle.*)
exception ContinueHorsBoucle

(* Exceptions liées aux pointeurs si la marque ne convient pas au type de base
 * associé à la variable. *)
exception RefInterdite
(* MarqueurInattendu : Erreur qui désigne une incompatibilité entre le type d'une fonction attendu
 * et celui de la variable utilisée. *)
exception MarqueurInattendu

(* Surcharge impossible : Erreur levée lors de l'association entre la fonction appelée et celles déclarées impossibles.
 * Cette exception généralise donc Exceptions.TypesParametresInattendus *)
exception SurchargeImpossible