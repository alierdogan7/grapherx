%{
	void print(int type, char *string){
		if(type == 0)
			printf("[Reserved:%s]",string);
		else
			printf("[Token:%s]",string);
	}	

%}

DIGIT [0-9]
SPACE [ \t]+
ALPHABETIC [a-zA-Z]
ALPHANUMERIC ({ALPHABETIC}|{DIGIT})
IDENTIFIER {ALPHABETIC}{ALPHANUMERIC}*
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
<IN_COMMENT>"*/"        { BEGIN(INITIAL); printf("COMMENT"); }
<IN_COMMENT>"*"         // eat the Texas
<IN_COMMENT>[^*]+  // eat comment in chunks



{DGRAPH} {
	print(0,"DGRAPH");
	return DGRAPH;
}

{UGRAPH} {
	 print(0,"UGRAPH");
	 return DGRAPH;
}		
{VERTEX}{
	 print(0,"VERTEX");
	 return VERTEX;
}	

{EDGE} {
	print(0,"EDGE");
	return EDGE;	
} 

{IDENTIFIER} { 
	print(1, "IDENTIFIER");
	return IDENTIFIER ;
}

{INTEGER} { 
	print(1,"INTEGER");
	return INTEGER;
}

{FLOAT} { 
	print(1,"FLOAT");
	return FLOAT ;
}

{STRING}{ 
	print (1,"STRING");
	return STRING;
} 

{LPARAM} { 
	print(1, "LPARAM");
	return LPARAM;
}

{RPARAM}{ 
	print(1, "RPARAM");
	return RPARAM;
} 

{LBRACE} { 
 	print(1, "LBRACE");
	return LBRACE ;
}

{RBRACE} { 
	print(1, "RBRACE");
	return RBRACE;
}
{LBRACKET} { 
	print(1, "LBRACKET");
	return LBRACKET;
}

{RBRACKET} { 
	print(1, "RBRACKET");
	return RBRACKET;
}

{COMMA} { 
	print(1, "COMMA");
	return COMMA;
}

{ASSIGN} { 
	print(1, "ASSIGN");
	return ASSIGN;
}

{COLON} { 
	print(1, "COLON");
	return COLON ;
}

{SEMICOLON}{ 
	print(1, "SEMICOLON");
	return SEMICOLON;
}

%%

int main(void){
	yylex();
	return 0;
}





