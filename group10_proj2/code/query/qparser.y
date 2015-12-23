%token ID 
%token LPARAM 
%token RPARAM 
%token LBRACKET 
%token RBRACKET 
%token STRING 
%token ASSIGN
%token SEMICOLON 
%token COMMA 
%token WHERE 
%token MATCH 
%token FROM 
%token RELATION 
%token DOT 
%token CONCAT 
%token RLINK
%token KLEENE 
%token ALTERATION 
%token VERTEX 
%token EDGE 
%token RQUERY
%token RCARAT
%token DOLLAR

%union 
{
  char *string;
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
		query_declaration document
		|
		;
query_declaration:
		query_definition path_query
		;

query_definition:
		RQUERY ID ASSIGN
		|
		;

path_query: 
		MATCH query query_tail
		;

query:
	expr expr_tail
	;


query_tail:
	FROM ID relation_declarition
	|
	;

expr:
	VERTEX RLINK EDGE RCARAT VERTEX
	| LPARAM expr RPARAM unary_operation expr_tail
	;

expr_tail:
	operation expr expr_tail
	| 
	;


relation_declarition:
	WHERE relations SEMICOLON
	|
	;


operation:
	CONCAT
	| ALTERATION
	;

unary_operation:
	KLEENE
	|
	;

relations: 
		relation_definition relations
		|
		;

relation_definition:
		ID DOT ID ASSIGN assignment
		;

assignment:
		STRING
		|DOLLAR ID
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
