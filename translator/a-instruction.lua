local function add_zeros(str)
	local missing = 16 - #str
	for _ = 1, missing, 1 do
		str = "0" .. str
	end
	return str
end

local function int2bin(num)
	local t = {}
	local rest = nil
	while num > 0 do
		rest = math.floor(num % 2)
		table.insert(t, 1, rest)
		num = (num - rest) / 2
	end
	return table.concat(t)
end

local AInstruction = {}
AInstruction.__index = AInstruction

function AInstruction.new(instruction, symbol_table)
	local instance = setmetatable({}, AInstruction)
	instance.instruction = instruction
	instance.symbol_table = symbol_table
	return instance
end

function AInstruction.translate(self)
	local label = self.instruction:label()
	local number = tonumber(label, 10)
	if not number then
		number = self.symbol_table:get(label)
	end
	return add_zeros(int2bin(number))
end

return AInstruction
