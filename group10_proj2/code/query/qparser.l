%{
	#include <iostream>
	#include "y.tab.h"
	using namespace std;
	int yyparse();
%}

%option yylineno



RQUERY query
MATCH MATCH
FROM FROM
WHERE WHERE
RELATION relation
DIGIT [0-9]
SPACE [ \t]+
STRING \".[^\"]*\"
ALPHABETIC [a-zA-Z]
ALPHANUMERIC ({ALPHABETIC}|{DIGIT})
ID {ALPHABETIC}{ALPHANUMERIC}*
INTEGER [+-]?{DIGIT}+
FLOAT [-+]?{DIGIT}+\.{DIGIT}+
LPARAM \(
RPARAM \)
LBRACE \{
RBRACE \}
LBRACKET \[
RBRACKET \]
COMMA ,
RLINK \-
CONCAT \->
ASSIGN \=
/* COMMENT \/\*(.|\n)*\*\/  */
COLON :
SEMICOLON \;
VERTEX {LPARAM}{ID}{RPARAM}
EDGE {LBRACKET}{ID}{RBRACKET}
DOT \.
KLEENE \*
ALTERATION \|
RCARAT \>
DOLLAR \$

%x IN_COMMENT 


%%

<INITIAL>"/*"           BEGIN(IN_COMMENT);
<IN_COMMENT>"*/"        { 
						BEGIN(INITIAL); 
						//printf(""); 
						}
<IN_COMMENT>"*"         // eat the Texas
<IN_COMMENT>[^*]+  // eat comment in chunks


{SPACE} { /* skip whitespace */
  ;
} 	

{RQUERY} return(RQUERY);
{FROM} return(FROM);
{WHERE} return(WHERE);
{MATCH} return(MATCH);

{VERTEX} return (VERTEX);
{EDGE} return (EDGE);
{KLEENE} return (KLEENE);
{ALTERATION} return (ALTERATION);
{CONCAT} return (CONCAT);
{RLINK} return (RLINK);
{ID} return (ID);
{DOT} return (DOT);
{STRING} return (STRING);
{LPARAM} return (LPARAM);
{RPARAM} return (RPARAM);
{LBRACKET} return (LBRACKET);
{RBRACKET} return (RBRACKET);
{COMMA} return (COMMA);
{ASSIGN} return (ASSIGN);
{SEMICOLON} return (SEMICOLON);
{RCARAT} return (RCARAT);
{RELATION} return(RELATION);
{DOLLAR} return (DOLLAR);
[\n] {}
%%


int yywrap()
{
	return 1;
}




