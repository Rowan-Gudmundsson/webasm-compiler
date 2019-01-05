#include "table.h"

// Symbol
Symbol::Symbol() : v_offset(_v_offset), v_name(_v_name) {}

// Scope
Scope::Scope() {}

void Scope::insert(Symbol* sym) {
	if (symbols.find(sym->v_name) == symbols.end()) {
		symbols.insert(std::pair<std::string, Symbol*>(sym->v_name, sym));
	} else {
		throw SymbolError("Variable redeclaration");
	}
}

Symbol* Scope::find(const std::string& name) {
	if (symbols.find(name) == symbols.end()) {
		throw SymbolError("Undefined reference");
	} else {
		return symbols[name];
	}
}

Scope::~Scope() {
	for (auto& i : symbols) {
		delete i.second;
		i.second = nullptr;
	}
	symbols.clear();
}

// SymbolTable
SymbolTable::SymbolTable() {}

void SymbolTable::push_scope() {
	if (scopes.size() != 0) {
		scopes.insert(scopes.begin(), new Scope());
	} else {
		scopes.push_back(new Scope());
	}
}

void SymbolTable::pop_scope() {
	if (scopes.size() != 0) {
		scopes.erase(scopes.begin());
	} else {
		throw SymbolError("No scopes to pop");
	}
}

void SymbolTable::insert(Symbol* sym) {
	try {
		scopes.front()->insert(sym);
	} catch (const SymbolError& err) { throw err; }
}

Symbol* SymbolTable::find(const std::string& name) {
	for (const auto& i : scopes) {
		try {
			i->find(name);
		} catch (const SymbolError& err) {
			if (i == scopes.back()) { throw err; }
		}
	}
}

SymbolTable::~SymbolTable() {}

// ObjectTable