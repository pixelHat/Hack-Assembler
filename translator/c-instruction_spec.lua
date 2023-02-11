local CInstruction = require("parser.c-instruction")
local Translator = require("translator.c-insctruction")
local SymbolTable = require("translator.symbol-table")

local symbol_table = SymbolTable.new()

describe("C Instruction Translator", function()
	it("D=M", function()
		local instruction = CInstruction.new("D=M")
		local translator = Translator.new(instruction, symbol_table)
		local sut = translator:translate()
		assert.are.equals(sut, "1111110000010000")
	end)

	it("AD=M", function()
		local instruction = CInstruction.new("AD=M")
		local translator = Translator.new(instruction, symbol_table)
		local sut = translator:translate()
		assert.are.equals(sut, "1111110000110000")
	end)

	it("AD=M;JEQ", function()
		local instruction = CInstruction.new("AD=M;JEQ")
		local translator = Translator.new(instruction, symbol_table)
		local sut = translator:translate()
		assert.are.equals(sut, "1111110000110010")
	end)

	it("0;JMP", function()
		local instruction = CInstruction.new("0;JMP")
		local translator = Translator.new(instruction, symbol_table)
		local sut = translator:translate()
		assert.are.equals(sut, "1110101010000111")
	end)

	it("A=D+1", function()
		local instruction = CInstruction.new("A=D+1")
		local translator = Translator.new(instruction, symbol_table)
		local sut = translator:translate()
		assert.are.equals(sut, "1110011111100000")
	end)
end)