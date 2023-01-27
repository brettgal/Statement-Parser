/*Lex Program*/
%{
#include "bison.tab.h"
#include<stdio.h>
#include<stdlib.h>
void errorMessage();
%}
/*Rule Section*/
%%
[0-9]		return("DIGIT");
[a-zA-Z]	return("CHAR");
[+|-|*|\x2F|%]	return("OP");
[\x20]		return("");i
[\n]		return("NEWLINE");
[(] 		return("OPENP");
[)]		return("CLOSEP");
[=]		return("EQUAL");
[;]		return("SEMICOLON");
.		errorMessage();
%%
void errorMessage(){
printf("ERROR: UNEXPECTED INPUT; UNABLE TO TOKENIZE: ",yytext);
}

int main(int argc, char *argv[]){
    
	FILE *file = fopen(argv[1], "r");
	if(!file){
		printf("file is not valid");
		return -1;
	}

	yyin = file;

	while(yylex());
	fclose(file);

	return 0;

	}	
