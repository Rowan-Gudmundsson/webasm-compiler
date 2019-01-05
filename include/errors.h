#pragma once

#include <stdexcept>

class ScannerError : public std::runtime_error {
	public:
	ScannerError(const std::string& what) : std::runtime_error(what){};
};

class ParserError : public std::runtime_error {
	public:
	ParserError(const std::string& what) : std::runtime_error(what){};
};

class SymbolError : public std::runtime_error {
	public:
	SymbolError(const std::string& what) : std::runtime_error(what){};
};