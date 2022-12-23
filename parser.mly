/* Imports. */

%{

open Type
open Ast.AstSyntax
open List
%}


%token <int> ENTIER
%token <string> ID
%token RETURN
%token PV
%token AO
%token AF
%token PF
%token PO
%token EQUAL
%token CONST
%token PRINT
%token IF
%token ELSE
%token WHILE
%token BOOL
%token INT
%token RAT
%token CALL 
%token CO
%token CF
%token SLASH
%token NUM
%token DENOM
%token TRUE
%token FALSE
%token PLUS
%token MULT
%token INF
%token EOF
(* Pointeurs *)
%token NEW
%token NULL
%token ADR
(* ternaire *)
%token QMARK
%token COLON
(* boucles *)
%token LOOP
%token BREAK
%token CONTINUE

(* Type de l'attribut synthétisé des non-terminaux *)
%type <programme> prog
%type <instruction list> bloc
%type <fonction> fonc
%type <instruction> i
%type <typ> typ
%type <identifiant> r
%type <typ*identifiant> param
%type <expression> e

(* Type et définition de l'axiome *)
%start <Ast.AstSyntax.programme> main

%%

main : lfi=prog EOF     {lfi}

prog : lf=fonc* ID li=bloc  {Programme (lf, map (fun x -> (x,(0,[]))) li)}

r :
(*|ident=ID              {Symbole ident} (* a = 7 -> *a *)*)
(*| MULT r1 = r             {Pointeur(r1)} (* a = 7; b = *a; c = b *)*)
|ladr=MULT* ident=ID     {(ident, fold_left (fun x _ -> Pointeur(x)) Neant ladr)}        

fonc : t=typ n=r PO lp=param* PF li=bloc {Fonction(t,n,lp,map (fun x -> (x,(0,[]))) li)}

param : t=typ n=r  {(t,n)}

bloc : AO li=i* AF      {li} (* Rq : j'ai voulu enlever les map d'ajout de contexte pour le faire ici mais ça ne marche pas *)

i :
| t=typ n=r EQUAL e1=e PV           {Declaration (t,n,e1)}
| n=r EQUAL e1=e PV                 {Affectation (n,e1)}
| CONST n=r EQUAL e=ENTIER PV       {Constante (n,e)}
| PRINT e1=e PV                     {Affichage (e1)}
| IF exp=e li1=bloc ELSE li2=bloc   {Conditionnelle (exp,map (fun x -> (x,(0,[]))) li1,map (fun x -> (x,(0,[])))li2)}
(* IF sans else *)
| IF exp=e li1=bloc                 {Conditionnelle (exp,map (fun x -> (x,(0,[]))) li1,[])}
| WHILE exp=e li=bloc               {TantQue (exp,map (fun x -> (x,(0,[]))) li)}
| RETURN exp=e PV                   {Retour (exp)}
(* Affectation incrémentée *)
| n=r PLUS EQUAL e1=e PV           {Affectation (n,Binaire (Plus,Identifiant n,e1))}
(* Prise en compte de <variable>++ et ++<variable>*)
| PLUS PLUS n=r PV                 {Affectation (n,Binaire (Plus,Identifiant n,Entier 1))}
| n=r PLUS PLUS PV                 {Affectation (n,Binaire (Plus,Identifiant n,Entier 1))}
(* Instructions pour les boucles *)
| n=ID COLON LOOP li=bloc           {Boucle(Some(n),map (fun x -> (x,(0,[]))) li)}
| LOOP li=bloc                      {Boucle(None,map (fun x -> (x,(0,[]))) li)}
| BREAK n=ID PV                     {Break(Some(n))}
| BREAK PV                          {Break(None)}
| CONTINUE n=ID PV                  {Continue(Some(n))}
| CONTINUE PV                       {Continue(None)}


typ :
| BOOL        {Bool}
| INT         {Int}
| RAT         {Rat}
(*| t=typ r1=r  {t,r} (* int ** a = *b *) + rq: avant marchait pas, typ doit renvoyer un Type.typ*)

e : 
| CALL n=r PO lp=e* PF    {AppelFonction (n,lp)}
| CO e1=e SLASH e2=e CF   {Binaire(Fraction,e1,e2)}
(*| n=ID                    {Ident n}*)
| TRUE                    {Booleen true}
| FALSE                   {Booleen false}
| e=ENTIER                {Entier e}
| NUM e1=e                {Unaire(Numerateur,e1)}
| DENOM e1=e              {Unaire(Denominateur,e1)}
| PO e1=e PLUS e2=e PF    {Binaire (Plus,e1,e2)}
| PO e1=e MULT e2=e PF    {Binaire (Mult,e1,e2)}
| PO e1=e EQUAL e2=e PF   {Binaire (Equ,e1,e2)}
| PO e1=e INF e2=e PF     {Binaire (Inf,e1,e2)}
| PO exp=e PF             {exp}
(* pointers *)
| NEW t=typ ladr=MULT*    {New (t, fold_left (fun x _ -> Pointeur(x)) Neant ladr)}
| NULL                    {NULL}
| ADR ident=r             {Adr(ident)}
| r1=r                    {Identifiant(r1)}
(* ternaire *)
| PO e1=e QMARK e2=e COLON e3=e PF {Ternaire (e1,e2,e3)}


