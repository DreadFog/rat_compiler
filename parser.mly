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
%token DEFINE
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
%type <string> idC
%type <typ*identifiant> param
%type <expression> e

(* Type et définition de l'axiome *)
%start <Ast.AstSyntax.programme> main

%%

main : lfi=prog EOF     {lfi}

prog : lf=fonc* ID li=bloc  {Programme (lf,li)}

r :
|ladr=MULT* ident=ID     {(ident, fold_left (fun x _ -> Pointeur(x)) Neant ladr)}        

fonc : t=typ n=r PO lp=param* PF li=bloc {Fonction(t,n,lp,li)}

param : t=typ n=r  {(t,n)}

bloc : AO li=i* AF      {li}

idC :
| DEFINE n=ID COLON     {n}

i :
| t=typ n=r EQUAL e1=e PV           {Declaration (t,n,e1)}
| n=r EQUAL e1=e PV                 {Affectation (n,e1)}
| CONST n=r EQUAL e=ENTIER PV       {Constante (n,e)}
| PRINT e1=e PV                     {Affichage (e1)}
| IF exp=e li1=bloc ELSE li2=bloc   {Conditionnelle (exp,li1,li2)}
(* IF sans else *)
| IF exp=e li1=bloc                 {Conditionnelle (exp,li1,[])}
| WHILE exp=e li=bloc               {TantQue (exp,li)}
| RETURN exp=e PV                   {Retour (exp)}
(* Affectation incrémentée *)
| n=r PLUS EQUAL e1=e PV            {Affectation (n,Binaire (Plus,Identifiant n,e1))}
(* Prise en compte de <variable>++ et ++<variable> *)
| PLUS PLUS n=r PV                  {Affectation (n,Binaire (Plus,Identifiant n,Entier 1))}
| n=r PLUS PLUS PV                  {Affectation (n,Binaire (Plus,Identifiant n,Entier 1))}
(* Instructions pour les boucles *)
| n=idC? LOOP li=bloc PV            {Boucle(n,li)}
| BREAK n=ID? PV                    {Break(n)}
| CONTINUE n=ID? PV                 {Continue(n)}


typ :
| BOOL        {Bool}
| INT         {Int}
| RAT         {Rat}

e : 
| CALL n=r PO lp=e* PF              {AppelFonction (n,lp)}
| CO e1=e SLASH e2=e CF             {Binaire(Fraction,e1,e2)}
| TRUE                              {Booleen true}
| FALSE                             {Booleen false}
| e=ENTIER                          {Entier e}
| NUM e1=e                          {Unaire(Numerateur,e1)}
| DENOM e1=e                        {Unaire(Denominateur,e1)}
| PO e1=e PLUS e2=e PF              {Binaire (Plus,e1,e2)}
| PO e1=e MULT e2=e PF              {Binaire (Mult,e1,e2)}
| PO e1=e EQUAL e2=e PF             {Binaire (Equ,e1,e2)}
| PO e1=e INF e2=e PF               {Binaire (Inf,e1,e2)}
| PO exp=e PF                       {exp}
| r1=r                              {Identifiant(r1)}
(* pointeurs *)
| NEW PO t=typ ladr=MULT* PF        {New (t, fold_left (fun x _ -> Pointeur(x)) Neant ladr)}
| NULL                              {NULL}
| ADR ident=r                       {Adr(ident)}
(* ternaire *)
| PO e1=e QMARK e2=e COLON e3=e PF  {Ternaire (e1,e2,e3)}

