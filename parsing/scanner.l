%{
  // Includes
  #include "tokens.h"
  #include "table.h"

  #define RETURN_TOKEN(token) col_num += yyleng; return token;

  unsigned line_num = 1;
  unsigned col_num = 1;

  int yyerror(char* err);

  SymbolTable table;
%}

DELIM   [ \t\r]
DIGIT   [0-9]
INTEGER {DIGIT}+
ID      [_a-zA-z][_a-zA-Z0-9]*
LBRACK  "["
RBRACK  "]"
BOOLEAN  "true"|"false"

%%

{DELIM}    { col_num++; }
\n         { line_num++; col_num = 1; }

{INTEGER}  {
  char* dummy;
  long long val = strtoll(yytext, &dummy, 10);
  yylval.ival = val;
  RETURN_TOKEN(INTEGER_CONSTANT);
}

{BOOLEAN}  { RETURN_TOKEN(BOOLEAN_CONSTANT); }

","        { RETURN_TOKEN(COMMA); }
"="        { RETURN_TOKEN(ASSIGN); }
":="       { RETURN_TOKEN(AUTOASSIGN); }
";"        { RETURN_TOKEN(SEMI); }
"*"        { RETURN_TOKEN(ASTERISK); }

"<"        { RETURN_TOKEN(LANGLE); }
">"        { RETURN_TOKEN(RANGLE); }
"{"        { RETURN_TOKEN(LBRACE); }
"}"        { RETURN_TOKEN(RBRACE); }
"("        { RETURN_TOKEN(LPAREN); }
")"        { RETURN_TOKEN(RPAREN); }
{LBRACK}   { RETURN_TOKEN(LBRACKET); }
{RBRACK}   { RETURN_TOKEN(RBRACKET); }

"func"     { RETURN_TOKEN(FUNC); }
"let"      { RETURN_TOKEN(LET); }
"const"    { RETURN_TOKEN(CONST); }
"static"   { RETURN_TOKEN(STATIC); }

"if"       { RETURN_TOKEN(IF); }
"elif"     { RETURN_TOKEN(ELSEIF); }
"else"     { RETURN_TOKEN(ELSE); }
"switch"   { RETURN_TOKEN(SWITCH); }

"while"    { RETURN_TOKEN(WHILE); }
"do"       { RETURN_TOKEN(DO); }
"for"      { RETURN_TOKEN(FOR); }

"break"    { RETURN_TOKEN(BREAK); }
"continue" { RETURN_TOKEN(CONTINUE); }
"return"   { RETURN_TOKEN(RETURN); }
"goto"     { RETURN_TOKEN(GOTO); }

"bool"     { RETURN_TOKEN(BOOL); }
"int"      { RETURN_TOKEN(INT); }
"int8"     { RETURN_TOKEN(INT_8); }
"int16"    { RETURN_TOKEN(INT_16); }
"int32"    { RETURN_TOKEN(INT_32); }
"int64"    { RETURN_TOKEN(INT_64); }
"char"     { RETURN_TOKEN(CHAR); }
"float"    { RETURN_TOKEN(FLOAT); }
"float64"  { RETURN_TOKEN(FLOAT_64); }
"vec"      { RETURN_TOKEN(VEC); }
"vec2"     { RETURN_TOKEN(VEC_2); }
"vec3"     { RETURN_TOKEN(VEC_3); }
"vec4"     { RETURN_TOKEN(VEC_4); }
"mat"      { RETURN_TOKEN(MAT); }
"mat2"     { RETURN_TOKEN(MAT_2); }
"mat3"     { RETURN_TOKEN(MAT_3); }
"mat4"     { RETURN_TOKEN(MAT_4); }

{ID}       { RETURN_TOKEN(IDENTIFIER); }

.          { RETURN_TOKEN(ERROR); }

%%

int yywrap(void) {
  return 1;
}