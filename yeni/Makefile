all1: lexer parser
	g++ y.tab.c lex.yy.c -o definition_parser
	
lexer: scan.l
	flex scan.l

parser: definition_parse.y
	yacc -d definition_parse.y

