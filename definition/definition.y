%token DGRAPH
%token UGRAPH
%token VERTEX
%token EDGE
%token IDENTIFIER
%token INTEGER
%token FLOAT
%token STRING
%token LPARAM
%token RPARAM
%token LBRACE
%token RBRACE
%token LBRACKET
%token RBRACKET
%token COMMA
%token ASSIGN
%token COLON
%token SEMICOLON
%token IDENTIFIER

%union 
{
  char * string;
  int integer;
  float float;
}

// Define the token value types

%type <integer> INTEGER 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 
%type <> 

%% //after this, CFG rules

graph :
	 graph_definition LBRACE body RBRACE
	;

body :
	 declaration body
	| assignment body
	|
	;

assignment : 
	 definition ASSIGN object SEMICOLON
	;

declaration :
	 definition SEMICOLON
	;

graph_definition :
	 graph_type var_name
	;

definition :
	 type_name var_name
	 ;

graph_type : 
	 DGRAPH
	| UGRAPH
	;

type_name :
	 VERTEX
	| EDGE
	;

object :
	 LBRACE RBRACE
	| LBRACE members RBRACE
	;

members :
	 pair
	| pair COMMA members
	;

pair : 
	 STRING COLON value
	;

array :
	 LBRACKET RBRACKET
	| LBRACKET elements RBRACKET
	;

elements :
	 value
	| value COMMA elements
	;

value :
	 STRING
	| INTEGER 
	| FLOAT
	| object
	| array
	;

var_name :
	IDENTIFIER
	;

%% //other C code

/*void yyerror(char *s) {
 fprintf(stderr, "line %d: %s\n", yylineno, s);
}*/

/*
graph -> graph_definition '{' body '}'
body -> declaration body
body -> assignment body
body -> ε
assignment -> definition '=' object ';'
declaration -> definition ';'
graph_definition -> graph_type var_name
definiton -> type_name var_name
graph_type -> 'dgraph'
graph_type -> 'ugraph'
type_name -> 'vertex'
type_name -> 'edge'
object -> '{' '}'
object -> '{' members '}'
members -> pair
members -> pair ',' members
pair -> string ':' value
array -> '[' ']'
array -> '[' elements ']'
elements -> value
elements -> value ',' elements
value -> string
value -> number
value -> object
value -> array
value -> true
value -> false
value -> null
*/