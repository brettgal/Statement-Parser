/*BISON*/
%{
#include <stdio.h>
#include <stdlib.h>
#include "flex.h"
extern int yylex(void);
extern int yyparse(void);
void yyerror(const char *msg);
linecount = 1;
%}
%left '-''+'
%left '*''/'
%error-verbose
%token DIGIT ID OP OPENP CLOSEP EQUAL SEMICOLON NEWLINE
%%


file:		| line
		| file line

line:		| ass NEWLINE {printf("line %d:GOOD\n",linecount);linecount++;}
		| error NEWLINE {yyerrok;}
		| exp NEWLINE {printf("line %d:GOOD\n",linecount);linecount++;}
		| opop NEWLINE {yyerror("invalid - OP OP");}

opop:		| ID OP OP ID  

exp:		| ID OP ID 
		| exp OP ID
		| ID OP exp 
		| OPENP exp CLOSEP 
		| OPENP ass CLOSEP
ass:		| ID EQUAL exp SEMICOLON


%%

int main (int argc, char ** argv){
	if (argc > 1) {
		yyin = fopen(argv[1],"r");
		if (yyin == NULL){
			printf("syntax: %s filename\n", argv[0]);
		}
	}
	yyparse();
	return 0;
}
void yyerror(const char *msg)	{
	linecount++;
	printf("line %d:BAD : %s\n",linecount,msg);
}
