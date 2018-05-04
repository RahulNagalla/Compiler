%{
#include <stdio.h>
#include <stdlib.h>
FILE *yyin;
int yylex (void);
void yyerror (char const *s);
%}

%token TYPE_INTEGER
%token DECLBLOCK
%token CODEBLOCK
%token declaration_list
%token statement_list
%token NUMBER
%token IDENTIFIER
%token ETOK
%token SMC
%token COMA
%token PRINT
%token PRINTL
%token READ
%token GOTO
%token IF
%token ELSE
%token FOR
%token WHILE
%token STRING
%token '['
%token  ']'
%token '}'
%token '{'
%token ','
%token '='
%token GT
%token LT
%token GE
%token LE
%token EQ
%token AND
%token OR
%left AND OR
%left EQ GT LT GE LE
%left '+'
%left '*'
%left '/'
%left '-'

%%

program     :	decl_block code_block

decl_block  : DECLBLOCK '{' decLIST '}'
            ;

decLIST   : declarationstatement   decLIST
          | declarationstatement



declarationstatement  : type var_decl remain_decl SMC
                      | type var_decl SMC
                      ;

var_decl : IDENTIFIER
         | IDENTIFIER '=' NUMBER
         |IDENTIFIER '=' '{' NUMBER '}'
         | IDENTIFIER '[' NUMBER ']'
         | IDENTIFIER '=' '{' NUMBER remainarray '}'
         ;

remainarray  : COMA NUMBER remainarray
             | COMA NUMBER

remain_decl : COMA var_decl remain_decl
  | COMA var_decl
  ;


type  : TYPE_INTEGER
      ;



code_block:  CODEBLOCK '{' codeLIST '}'

codeLIST : codeLIST codedeclaration
|codedeclaration
          ;



codedeclaration :

                READ read_var SMC

                |PRINT STRING COMA var SMC
                |PRINTL STRING SMC

                |WHILE boolexpr '{' codeLIST '}'

                |FOR IDENTIFIER '=' constant COMA constant '{' codeLIST '}'
                |FOR IDENTIFIER '=' constant COMA constant COMA     constant '{' codeLIST '}'

                |IF boolexpr '{' codeLIST '}'
                |IF boolexpr '{' codeLIST '}' ELSE boolexpr '{' codeLIST '}'

                |GOTO IDENTIFIER SMC
                |GOTO IDENTIFIER IF boolexpr SMC

                | IDENTIFIER ':'
                | var '=' mathexpr SMC
                | var '=' boolexpr SMC




var        :IDENTIFIER '[' mathexpr ']'
           |IDENTIFIER
           ;

read_var:   IDENTIFIER
            | IDENTIFIER '[' IDENTIFIER ']'   /* array */
            ;



boolexpr : '(' boolexpr ')'
               |boolexpr OR boolexpr
               |boolexpr AND boolexpr
               |mathexpr GT mathexpr
               |mathexpr GE mathexpr
               |mathexpr LT mathexpr
               |mathexpr LE mathexpr
               |mathexpr EQ mathexpr
;
mathexpr     : '(' mathexpr ')'
             |mathexpr '+' mathexpr
             |mathexpr  '-' mathexpr
             |mathexpr '/'  mathexpr
             |mathexpr '*' mathexpr
             |constant
;
constant     : IDENTIFIER
             | IDENTIFIER '[' mathexpr ']'
             | NUMBER
;



%%



void yyerror (char const *s)
{
       fprintf (stderr, "%s\n", s);
}

int main(int argc, char *argv[])
{
	if (argc == 1 ) {
		fprintf(stderr, "Correct usage: bcc filename\n");
		exit(1);
	}

	if (argc > 2) {
		fprintf(stderr, "Passing more arguments than necessary.\n");
		fprintf(stderr, "Correct usage: bcc filename\n");
	}

	yyin = fopen(argv[1], "r");

	yyparse();
}
