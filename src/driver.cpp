#include "driver.h"

int main(int argc, char** argv) {
	std::string input, output;
	if (argc > 1) {
		if (commandLineArgs(argc--, argv++, input, output)) {
			yyin = fopen(input.c_str(), "r");
			try {
				// yydebug = 1;
				yyparse();
			} catch (const SymbolError& err) {
				std::cout << "Symbol error exception thrown: " << err.what()
				          << std::endl;
			} catch (...) { std::cout << "Threw from somewhere." << std::endl; }
		} else {
			std::cout << "Failed to open files" << std::endl;
		}
	}

	return 0;
}

int yyerror(char* err) {
	std::cout << "Parser error: " << err << std::endl
	          << "At line: " << line_num << ", column: " << col_num
	          << std::endl;
	return 1;
}

bool commandLineArgs(int argc, char** argv, std::string& input,
                     std::string& output) {
	for (unsigned i = 0; i < argc; i++) {
		std::string arg = argv[i];
		if (arg == "-o") {
			if (i < argc - 1) {
				output = argv[i + 1];
			} else {
				return false;
			}
		} else if (i == argc - 1) {
			input = argv[i];
		}
	}

	return true;
}