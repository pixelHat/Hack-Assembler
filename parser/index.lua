local AInstruction = require("parser.a-instruction")
local CInstruction = require("parser.c-instruction")

local M = {}

function M.parser(instructions)
	local parsed_instructions = {}
	for _, i in pairs(instructions) do
		if string.sub(i, 1, 1) == "@" then
			table.insert(parsed_instructions, AInstruction.new(i))
		else
			table.insert(parsed_instructions, CInstruction.new(i))
		end
	end
	return parsed_instructions
end

return M
