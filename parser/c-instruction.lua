local utils = require("utils.index")

local CInstruction = {}
CInstruction.__index = CInstruction

local function split(str, separator)
	local splited = {}
	for w in str:gmatch("([^" .. separator .. "]+)") do
		table.insert(splited, w)
	end
	return splited
end

function CInstruction.new(instruction)
	local instance = setmetatable({}, CInstruction)
	instance.instruction = instruction
	return instance
end

function CInstruction.destination(self)
	local splited = split(self.instruction, "=")
	if #splited == 1 then
		return nil
	end
	return splited[1]
end

function CInstruction.comp(self)
	local splited = split(self.instruction, "=")
	local comp_and_jump = splited[1]
	if #splited == 2 then
		comp_and_jump = splited[2]
	end
	local splited_by_semicolon = split(comp_and_jump, ";")
	if #splited_by_semicolon <= 1 then
		return utils.trim(splited[2])
	end
	return utils.trim(splited_by_semicolon[1])
end

function CInstruction.jump(self)
	local splited = split(self.instruction, "=")
	local comp_and_jump = splited[1]
	if #splited == 2 then
		comp_and_jump = splited[2]
	end
	local splited_by_semicolon = split(comp_and_jump, ";")
	if #splited_by_semicolon <= 1 then
		return nil
	end
	return utils.trim(splited_by_semicolon[2])
end

return CInstruction
