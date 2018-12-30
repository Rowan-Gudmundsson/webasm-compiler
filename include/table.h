#pragma once

// Base table class
class GenericTable {
	public:
	// Constructors
	GenericTable();

	// Destructors
	~GenericTable();

	private:
	// Private data members

	// Private functions
};

// Class for symbol information
class SymbolTable : public GenericTable {
	public:
	// Constructors
	SymbolTable();

	// Destructors
	~SymbolTable();

	private:
};

// Class for struct information
class StructTable : public GenericTable {};
