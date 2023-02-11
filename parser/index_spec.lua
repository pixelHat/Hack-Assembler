local parser = require("parser.index")
local AInstruction = require("parser.a-instruction")
local CInstruction = require("parser.c-instruction")
local ATranslator = require("translator.a-instruction")
local CTranslator = require("translator.c-insctruction")

local tests = {
	"@10",
	"D=M",
	"@fim",
	"@FIM",
	"D=M;JQE",
}

local result = {
	ATranslator.new(AInstruction.new("@10")),
	CTranslator.new(CInstruction.new("D=M")),
	ATranslator.new(AInstruction.new("@fim")),
	ATranslator.new(AInstruction.new("@FIM")),
	CTranslator.new(CInstruction.new("D=M;JQE")),
}

describe("Parser", function()
	it("instruction", function()
		local sut = parser.parser(tests)
		assert.are.same(sut, result)
	end)
end)
