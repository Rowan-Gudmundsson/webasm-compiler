#pragma once

#include <fstream>
#include <iostream>
#include <string>
#include "errors.h"
#include "table.h"
#include "tokens.h"

int yyerror(char* err);
bool commandLineArgs(int argc, char** argv, std::string& input,
                     std::string& output);

extern FILE* yyin;
extern int yylex(void);

extern unsigned line_num;
extern unsigned col_num;
extern int yydebug;