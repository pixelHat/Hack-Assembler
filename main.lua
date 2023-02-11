local file = require("file")
local parser = require("parser.index")
local SymbolTable = require("translator.symbol-table")

local symbol_table = SymbolTable.new()
local file_name = arg[1]

local f = file.open_file(file_name .. ".asm", symbol_table)
if not f then
	print("Could not open the file " .. file_name)
	return
end

local function translate(instructions_parsed)
	local binary = {}
	for i = 1, #instructions_parsed do
		table.insert(binary, instructions_parsed[i]:translate())
	end
	return binary
end

local parsed = parser.parser(f, symbol_table)
local result = translate(parsed)
file.save_file(file_name .. ".hack", result)
