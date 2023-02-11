local AInstruction = require("parser.a-instruction")
local CInstruction = require("parser.c-instruction")
local AInstructionTranslator = require("translator.a-instruction")
local CInstructionTranslator = require("translator.c-insctruction")

local M = {}

function M.parser(instructions, symbol_table)
	local parsed_instructions = {}
	for _, i in pairs(instructions) do
                i = i:gsub("%s+", "")
		if string.sub(i, 1, 1) == "@" then
			local instruction = AInstruction.new(i)
			local translator = AInstructionTranslator.new(instruction, symbol_table)
			table.insert(parsed_instructions, translator)
		else
			local instruction = CInstruction.new(i)
			local translator = CInstructionTranslator.new(instruction, symbol_table)
			table.insert(parsed_instructions, translator)
		end
	end
	return parsed_instructions
end

return M
