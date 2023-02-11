local SymbolTable = {
	table = {},
	next_empty_variable_spot = 16,
}
SymbolTable.__index = SymbolTable

function SymbolTable.new()
	local instance = setmetatable({}, SymbolTable)
	instance.table = {
		["SCREEN"] = 16384,
		["KBD"] = 24576,
		["SP"] = 0,
		["LCL"] = 1,
		["ARG"] = 2,
		["THIS"] = 3,
		["THAT"] = 4,
	}
	for i = 1, 16 do
		instance.table["R" .. (i - 1)] = i - 1
	end
	return instance
end

function SymbolTable.get(self, key)
	local value = self.table[key]
	if not value then
		value = self.next_empty_variable_spot
		self.table[key] = value
		self.next_empty_variable_spot = self.next_empty_variable_spot + 1
	end
	return value
end

function SymbolTable.add_label(self, key, line)
	self.table[key] = line
end

return SymbolTable
