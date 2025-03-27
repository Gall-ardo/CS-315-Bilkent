parser: lex.yy.c y.tab.c
	gcc -o parser y.tab.c lex.yy.c
y.tab.c:  CS315_S25_Team13.yacc
	yacc -d CS315_S25_Team13.yacc
lex.yy.c:  CS315_S25_Team13.lex
	lex CS315_S25_Team13.lex
