%{
#include "parser.tab.h"
%}

%%
"declblock" return DECLBLOCK;
"codeblock" return CODEBLOCK;
"int"	return TYPE_INTEGER;
"print" return PRINT;
"printl"return PRINTL;
"goto"  return GOTO;
"if"    return IF;
"else"  return ELSE;
"while" return WHILE;
"for"   return FOR;
"read"  return READ;
"declaration_list"			return declaration_list;
"statement_list"		return statement_list;
[0-9][0-9]*	{
			printf("Token type: Number, Lexeme/Token Value: %s\n", yytext);
			return NUMBER;
                }

[a-zA-Z][a-zA-Z0-9]* {
			printf("Token type: Identifier, Lexeme/Token Value: %s\n", yytext);
			return IDENTIFIER;
		     }

"+"		return '+';
"-"		return '-';
"*"		return '*';
"{"		return '{';
"}"		return '}';
";"		return SMC;
"="		return '=';
"["   return '[';
"]"   return ']';
","   return  COMA;
">"   return  GT;
"<"   return  LT;
">="  return  GE;
"<="  return  LE;
"=="  return  EQ;
"&&"  return  AND;
"||"  return  OR;
":"	  return ':';
\"[^\"\']+\" return STRING;

[ \t]		{ /* Do nothing */ }
.		{
		  printf("Unexpected token encountered: %s\n", yytext);
		  return ETOK;
		}
