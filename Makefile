CC = gcc

parser: bison.tab.o lex.yy.o
	$(CC) -o parser bison.tab.o lex.yy.o -ll -lm
lex.yy.c: flex.l
	flex --header-file=flex.h flex.l

bison.tab.c bison.tab.h: bison.y
	bison -d -v bison.y
