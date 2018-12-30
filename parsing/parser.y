%{
  // Includes
  #include <iostream>

  int yyerror(char* err);
  int yylex(void);

%}

%union {
  // Non-terminal types
  int ival;
}

%token COMMA

%start declaration_statement

%%

declaration_statement: identifier AUTOASSIGN assignment_expression SEMI
  | qualifier_list identifier AUTOASSIGN assignment_expression SEMI
  | qualifier_list type direct_declarator ASSIGN assignment_expression SEMI
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

direct_declarator: identifier
  | pointer direct_declarator
  ;

pointer: ASTERISK
  | qualifier_list ASTERISK
  ;

identifier: IDENTIFIER
  ;
%%s