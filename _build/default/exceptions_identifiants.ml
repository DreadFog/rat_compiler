(* Exceptions pour la gestion des identificateurs *)
exception DoubleDeclaration of string 
exception IdentifiantNonDeclare of string 
exception MauvaiseUtilisationIdentifiant of string 

(* Utilisation illégale de return dans le programme principal *)
exception RetourDansMain
exception ErreurInterne

(* Exceptions liées aux pointeurs *)
exception RefInterdite