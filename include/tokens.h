/* A Bison parser, made by GNU Bison 3.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018 Free Software Foundation, Inc.

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

#ifndef YY_YY_USERS_ROWAN_PROGRAMMING_WEBASM_INCLUDE_TOKENS_H_INCLUDED
# define YY_YY_USERS_ROWAN_PROGRAMMING_WEBASM_INCLUDE_TOKENS_H_INCLUDED
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
    COMMA = 258,
    SEMI = 259,
    AUTOASSIGN = 260,
    ASSIGN = 261,
    INTEGER_CONSTANT = 262,
    BOOLEAN_CONSTANT = 263,
    LET = 264,
    CONST = 265,
    STATIC = 266,
    FUNC = 267,
    ASTERISK = 268,
    LANGLE = 269,
    RANGLE = 270,
    LPAREN = 271,
    RPAREN = 272,
    LBRACE = 273,
    RBRACE = 274,
    LBRACKET = 275,
    RBRACKET = 276,
    IDENTIFIER = 277,
    BOOL = 278,
    IF = 279,
    ELSE = 280,
    ELSEIF = 281,
    SWITCH = 282,
    WHILE = 283,
    DO = 284,
    FOR = 285,
    BREAK = 286,
    CONTINUE = 287,
    RETURN = 288,
    GOTO = 289,
    INT = 290,
    INT_8 = 291,
    INT_16 = 292,
    INT_32 = 293,
    INT_64 = 294,
    CHAR = 295,
    FLOAT = 296,
    FLOAT_64 = 297,
    VEC = 298,
    VEC_2 = 299,
    VEC_3 = 300,
    VEC_4 = 301,
    MAT = 302,
    MAT_2 = 303,
    MAT_3 = 304,
    MAT_4 = 305,
    ERROR = 306
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "/Users/rowan/programming/webasm/parsing/parser.y" /* yacc.c:1919  */

  // Non-terminal types
  int ival;

#line 111 "/Users/rowan/programming/webasm/include/tokens.h" /* yacc.c:1919  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_USERS_ROWAN_PROGRAMMING_WEBASM_INCLUDE_TOKENS_H_INCLUDED  */
