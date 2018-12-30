%{
#include "token.h"
// Includes
int line_num = 0;

int yyerror(char* err);
%}

DELIM   [ \t\r]
DIGIT   [0-9]
INTEGER {DIGIT}+

%%

\n    { line_num++; }

%%

int yywrap(void) {
  return 1;
}