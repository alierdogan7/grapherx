// Define the tokens

%token DGRAPH
%token UGRAPH
%token VERTEX
%token EDGE
%token ID
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

// Define the union that can hold different values for the tokens
 
%union 
{
  char * string;
  int integer;
  float floatcuk;
}

// Define the token value types

%type <string> ID
// define associativity of operations

//%left PLUS MINUS // the order defines precedence, 
//%left STAR DIV // so * and / has higher precedence than + and -

%{ 
  #include <iostream> 
  #include <string>
  using namespace std;
  // forward declarations
  extern int yylineno;
  void yyerror(string);
  int yylex(void);
  int numoferr;
 
%}

%%

document:
	graph document
	|
	;

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
	ID
	;

%%

// report errors
extern int yylineno;
void yyerror(string s) 
{
	numoferr++;
	cout << "error at line " << yylineno << ": " << s << endl;
}
int main()
{
	numoferr=0;
	yyparse();
	if(numoferr>0) {
	} else {
		cout << "Successfully parsed" << endl;
	}
	return 0;
}
