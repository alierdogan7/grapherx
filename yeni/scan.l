%{
#include<iostream>
#include "y.tab.h"
using namespace std;
int yyparse();
%}
%option yylineno


DIGIT [0-9]
SPACE [ \t]+
ALPHABETIC [a-zA-Z]
ALPHANUMERIC ({ALPHABETIC}|{DIGIT})
ID {ALPHABETIC}{ALPHANUMERIC}*
INTEGER [+-]?{DIGIT}+
FLOAT [-+]?{DIGIT}+\.{DIGIT}+
STRING \".[^\"]*\"
LPARAM \(
RPARAM \)
LBRACE \{
RBRACE \}
LBRACKET \[
RBRACKET \]
COMMA ,
ASSIGN =
COLON :
SEMICOLON ;
DGRAPH dgraph
UGRAPH ugraph
VERTEX vertex
EDGE edge

%x IN_COMMENT 

%%

<INITIAL>"/*"           BEGIN(IN_COMMENT);
<IN_COMMENT>"*/"        { 
						BEGIN(INITIAL); 
						printf("COMMENT "); 
						}
<IN_COMMENT>"*"         // eat the Texas
<IN_COMMENT>[^*]+  // eat comment in chunks

{SPACE} { /* skip whitespace */
  ;
}

{VERTEX} {
	 printf("VERTEX ");
	 return VERTEX;
}	

{EDGE} {
	printf("EDGE ");
	return EDGE;	
} 

{COLON} { 
	printf("COLON ");
	return COLON;
}

{SEMICOLON} { 
	printf("SEMICOLON ");
	return SEMICOLON;
}

{LPARAM} { 
	printf("LPARAM ");
	return LPARAM;
}

{RPARAM} { 
	printf("RPARAM ");
	return RPARAM;
} 

{DGRAPH} {
	printf("DGRAPH ");
	return DGRAPH;
}

{UGRAPH} {
	 printf("UGRAPH ");
	 return UGRAPH;
}		

{LBRACE} { 
 	printf("LBRACE ");
	return LBRACE ;
}

{RBRACE} { 
	printf("RBRACE ");
	return RBRACE;
}

{LBRACKET} { 
	printf("LBRACKET ");
	return LBRACKET;
}

{RBRACKET} { 
	printf("RBRACKET ");
	return RBRACKET;
}

{COMMA} { 
	printf("COMMA ");
	return COMMA;
}

{ASSIGN} { 
	printf("ASSIGN ");
	return ASSIGN;
}

{INTEGER} { 
	printf("INTEGER ");
	return INTEGER;
}

{FLOAT} { 
	printf("FLOAT ");
	return FLOAT;
}

{STRING} { 
	printf("STRING ");
	return STRING;
} 

{ID} { 
	printf("IDENTIFIER ");
	return ID;
}

%%

int yywrap()
{
	return 1;
}

