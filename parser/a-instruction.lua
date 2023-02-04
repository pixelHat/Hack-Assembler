local AInstruction = {}
AInstruction.__index = AInstruction

function AInstruction.new(instruction)
	local instance = setmetatable({}, AInstruction)
	instance.instruction = instruction
	return instance
end

function AInstruction.label(self)
	return string.sub(self.instruction, 2)
end

return AInstruction
