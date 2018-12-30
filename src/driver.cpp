#include "driver.h"

int main() {}

int yyerror(char* err) {
	std::cout << "Parser error: " << err << std::endl;
}