(* Ce fichier existe en tant que hotfix: il permet de break une interdépendance entre le module type et les autres*)
(* Exceptions pour la gestion des identificateurs *)
exception DoubleDeclaration of string 
exception IdentifiantNonDeclare of string 
exception MauvaiseUtilisationIdentifiant of string 

(* Utilisation illégale de return dans le programme principal *)
exception RetourDansMain
exception ErreurInterne
exception BreakHorsBoucle
exception ContinueHorsBoucle

(* Exceptions liées aux pointeurs *)
exception RefInterdite