local Instruction = require("parser.a-instruction")

describe("A instruction", function()
	describe("A register", function()
		it("sets the decimal number as the label", function()
			local instruction = Instruction.new("@10")
			local sut = instruction:label()
			assert.are.equal(sut, "10")
		end)
	end)

	describe("variable", function()
		it("sets the name variable as the label", function()
			local instruction = Instruction.new("@i")
			local sut = instruction:label()
			assert.are.equal(sut, "i")
		end)
	end)
end)
