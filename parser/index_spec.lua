local parser = require("parser.index")
local AInstruction = require("parser.a-instruction")
local CInstruction = require("parser.c-instruction")

local tests = {
	"@10",
	"D=M",
	"@fim",
	"@FIM",
	"D=M;JQE",
}

local result = {
	AInstruction.new("@10"),
	CInstruction.new("D=M"),
	AInstruction.new("@fim"),
	AInstruction.new("@FIM"),
	AInstruction.new("D=M;JQE"),
}

describe("Parser", function()
	it("instruction", function()
		local sut = parser.parser(tests)
		assert.are.same(sut, result)
	end)
end)
