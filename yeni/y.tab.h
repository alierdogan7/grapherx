/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    DGRAPH = 258,
    UGRAPH = 259,
    VERTEX = 260,
    EDGE = 261,
    ID = 262,
    INTEGER = 263,
    FLOAT = 264,
    STRING = 265,
    LPARAM = 266,
    RPARAM = 267,
    LBRACE = 268,
    RBRACE = 269,
    LBRACKET = 270,
    RBRACKET = 271,
    COMMA = 272,
    ASSIGN = 273,
    COLON = 274,
    SEMICOLON = 275
  };
#endif
/* Tokens.  */
#define DGRAPH 258
#define UGRAPH 259
#define VERTEX 260
#define EDGE 261
#define ID 262
#define INTEGER 263
#define FLOAT 264
#define STRING 265
#define LPARAM 266
#define RPARAM 267
#define LBRACE 268
#define RBRACE 269
#define LBRACKET 270
#define RBRACKET 271
#define COMMA 272
#define ASSIGN 273
#define COLON 274
#define SEMICOLON 275

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 25 "definition_parse.y" /* yacc.c:1909  */

  char * string;
  int integer;
  float floatcuk;

#line 100 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
