%{
  // Includes
  #include <iostream>
  #include "table.h"

  #define YYDEBUG 1

  extern SymbolTable table;

  int yyerror(char* err);
  int yylex(void);
%}

%union {
  // Non-terminal types
  int ival;
}

%token COMMA SEMI
%token AUTOASSIGN ASSIGN
%token INTEGER_CONSTANT
%token BOOLEAN_CONSTANT
%token LET CONST STATIC
%token FUNC
%token ASTERISK
%token LANGLE RANGLE LPAREN RPAREN LBRACE RBRACE
%token LBRACKET RBRACKET
%token IDENTIFIER
%token BOOL
%token IF ELSE ELSEIF SWITCH
%token WHILE DO FOR
%token BREAK CONTINUE RETURN GOTO
%token INT INT_8 INT_16 INT_32 INT_64
%token CHAR
%token FLOAT FLOAT_64
%token VEC VEC_2 VEC_3 VEC_4
%token MAT MAT_2 MAT_3 MAT_4
%token ERROR

%start translation_unit

%%

translation_unit: external_declaration {
    // std::cout << "REDUCING EXT" << std::endl;
  }
  | translation_unit external_declaration {
    // std::cout << "REDUCING EXT AGAIN" << std::endl;
  }
  |
  ;

external_declaration: function_definition {

  }
  | declaration_statement {
    // std::cout << "REDUCING DECL" << std::endl;
  }
  ;

declatator: identifier type_specifiers
  ;

return_list: declatator
  | declatator COMMA return_list
  ;

return_type: type_specifiers
  | LPAREN return_list RPAREN
  |
  ;

function_definition: FUNC identifier LPAREN RPAREN return_type compound_statement {

  }
  | FUNC identifier LPAREN function_parameters RPAREN return_type compound_statement {
    
  }
  ;

function_parameters: declatator
  | declatator COMMA function_parameters
  ;

compound_statement: LBRACE RBRACE
  | LBRACE statement_list RBRACE
  ;

statement_list: statement_type
  | statement_type statement_list
  ;

statement_type: declaration_statement
  | function_definition
  | generic_statement
  ;

generic_statement: selection_statement
  | itteration_statement
  | jump_statement
  ;

selection_statement: IF LPAREN expression RPAREN compound_statement
  | IF expression compound_statement
  | IF LPAREN expression RPAREN compound_statement ELSE compound_statement
  | IF expression compound_statement ELSE compound_statement
  | SWITCH LPAREN expression RPAREN compound_statement
  ;

expression: BOOLEAN_CONSTANT
  ;

itteration_statement: WHILE LPAREN expression RPAREN compound_statement
  | DO compound_statement WHILE LPAREN expression RPAREN SEMI
  | FOR LPAREN expression SEMI expression SEMI expression RPAREN compound_statement
  | FOR LPAREN expression SEMI expression SEMI RPAREN compound_statement
  | FOR LPAREN expression SEMI SEMI expression RPAREN compound_statement
  | FOR LPAREN expression SEMI SEMI RPAREN compound_statement
  | FOR LPAREN SEMI expression SEMI expression RPAREN compound_statement
  | FOR LPAREN SEMI expression SEMI RPAREN compound_statement
  | FOR LPAREN SEMI SEMI expression RPAREN compound_statement
  | FOR LPAREN SEMI SEMI RPAREN compound_statement
  ;

jump_statement: GOTO identifier SEMI
  | CONTINUE SEMI
  | BREAK SEMI
  | RETURN SEMI
  | RETURN expression SEMI
  ;

declaration_statement: identifier AUTOASSIGN assignment_expression SEMI {
    // std::cout << "REDUCING AUTOASSIGN" << std::endl;
  }
  | qualifier_list identifier AUTOASSIGN assignment_expression SEMI {
    // std::cout << "REDUCING AUTOASSIGN W/ QUALIFIER" << std::endl;
  }
  | qualifier_list declatator ASSIGN assignment_expression SEMI {
    // std::cout << "REDUCING NORMAL ASSIGN" << std::endl;
  }
  ;

type_specifiers: type
  | type pointer_level
  ;

pointer_level: ASTERISK
  | ASTERISK pointer_level
  ;

assignment_expression: INTEGER_CONSTANT
  ;

qualifier_list: qualifier
  | qualifier qualifier_list
  ;

qualifier: LET
  | CONST
  | STATIC
  ;

type: primative
  | VEC LANGLE INTEGER_CONSTANT RANGLE primative_specifier
  | VEC_2 primative_specifier
  | VEC_3 primative_specifier
  | VEC_4 primative_specifier
  | MAT LANGLE INTEGER_CONSTANT COMMA INTEGER_CONSTANT RANGLE primative_specifier
  | MAT_2 primative_specifier
  | MAT_3 primative_specifier
  | MAT_4 primative_specifier
  ;

primative_specifier:
  | LANGLE primative RANGLE {
  }
  |
  ;

primative: BOOL
  | INT
  | INT_8
  | INT_16
  | INT_32
  | INT_64
  | CHAR
  | FLOAT
  | FLOAT_64
  ;

identifier: IDENTIFIER
  ;

%%