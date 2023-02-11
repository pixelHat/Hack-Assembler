local CInstruction = {
	instruction = nil,
	symbol_table = nil,
}
CInstruction.__index = CInstruction

local comp_table = {
	["0"] = "0101010",
	["1"] = "0111111",
	["-1"] = "0111010",
	["D"] = "0001100",
	["A"] = "0110000",
	["!D"] = "0001101",
	["!A"] = "0110001",
	["-D"] = "0001111",
	["-A"] = "0110011",
	["D+1"] = "0011111",
	["A+1"] = "0110111",
	["D-1"] = "0001110",
	["A-1"] = "0110010",
	["D+A"] = "0000010",
	["D-A"] = "0010011",
	["A-D"] = "0000111",
	["D&A"] = "0000000",
	["D|A"] = "0010101",
	["M"] = "1110000",
	["!M"] = "1110001",
	["-M"] = "1110011",
	["M+1"] = "1110111",
	["M-1"] = "1110010",
	["D+M"] = "1000010",
	["D-M"] = "1010011",
	["M-D"] = "1000111",
	["D&M"] = "1000000",
	["D|M"] = "1010101",
}

local dest_table = {
	["A"] = "100",
	["D"] = "010",
	["M"] = "001",
	["AM"] = "101",
	["MD"] = "011",
	["AD"] = "110",
	["AMD"] = "111",
}

local jump_table = {
	["JGT"] = "001",
	["JEQ"] = "010",
	["JGE"] = "011",
	["JLT"] = "100",
	["JNE"] = "101",
	["JLE"] = "110",
	["JMP"] = "111",
}
local with_default_get = {
	__index = function(table, index)
		if not index or not table[index] then
			return "000"
		end
		return table[index]
	end,
}
setmetatable(jump_table, with_default_get)
setmetatable(dest_table, with_default_get)

function CInstruction.new(instruction, symbol_table)
	local instance = setmetatable({}, CInstruction)
	instance.instruction = instruction
	instance.symbol_table = symbol_table
	return instance
end

function CInstruction.translate(self)
	local comp = comp_table[self.instruction:comp()]
	local dest = dest_table[self.instruction:destination()]
	local jump = jump_table[self.instruction:jump()]
	return "111" .. comp .. dest .. jump
end

return CInstruction
