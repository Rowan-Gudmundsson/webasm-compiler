#pragma

#include <map>
#include <stack>
#include <string>
#include <vector>
#include "errors.h"

// Symbol type
class Symbol {
	public:
	Symbol();
	const unsigned& v_offset;
	const std::string& v_name;

	private:
	std::string _v_name;

	unsigned _v_offset;
};

// Defines a scope
class Scope {
	public:
	Scope();

	void insert(Symbol* sym);
	Symbol* find(const std::string& name);

	~Scope();

	private:
	std::map<std::string, Symbol*> symbols;
};

// Base table class
class GenericTable {
	public:
	// Constructors
	GenericTable() = default;

	virtual void push_scope()                     = 0;
	virtual void pop_scope()                      = 0;
	virtual void insert(Symbol* sym)              = 0;
	virtual Symbol* find(const std::string& name) = 0;

	// Destructors
	~GenericTable() = default;

	protected:
	// Private data members
	std::vector<Scope*> scopes;
	enum Mode { READ, WRITE, OBJECT };
	// Private functions
};

// Class for symbol information
class SymbolTable : public GenericTable {
	public:
	// Constructors
	SymbolTable();

	void push_scope() override;
	void pop_scope() override;
	void insert(Symbol* sym) override;
	Symbol* find(const std::string& name) override;

	// Destructors
	~SymbolTable();

	private:
};

// Class for struct information
class ObjectTable : public GenericTable {};
