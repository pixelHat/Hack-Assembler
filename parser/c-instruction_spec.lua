local Instruction = require("parser.c-instruction")

describe("C instruction", function()
	describe("D=M", function()
		local instruction = nil
		setup(function()
			instruction = Instruction.new("D=M")
		end)

		it("sets dest to D", function()
			local sut = instruction:destination()
			assert.are.equal(sut, "D")
		end)

		it("sets comp to M", function()
			local sut = instruction:comp()
			assert.are.equal(sut, "M")
		end)

		it("sets jump", function()
			local sut = instruction:jump()
			assert.is_nil(sut)
		end)
	end)

	describe("MD=M", function()
		local instruction = nil
		setup(function()
			instruction = Instruction.new("MD=M")
		end)

		it("sets dest", function()
			local sut = instruction:destination()
			assert.are.equal(sut, "MD")
		end)

		it("sets comp", function()
			local sut = instruction:comp()
			assert.are.equal(sut, "M")
		end)

		it("sets jump", function()
			local sut = instruction:jump()
			assert.is_nil(sut)
		end)
	end)

	describe("AMD=M", function()
		local instruction = nil
		setup(function()
			instruction = Instruction.new("AMD=M")
		end)

		it("sets dest", function()
			local sut = instruction:destination()
			assert.are.equal(sut, "AMD")
		end)

		it("sets comp", function()
			local sut = instruction:comp()
			assert.are.equal(sut, "M")
		end)

		it("sets jump", function()
			local sut = instruction:jump()
			assert.is_nil(sut)
		end)
	end)

	describe("D;JMP", function()
		local instruction = nil
		setup(function()
			instruction = Instruction.new("D;JMP")
		end)

		it("sets dest", function()
			local sut = instruction:destination()
			assert.is_nil(sut)
		end)

		it("sets comp", function()
			local sut = instruction:comp()
			assert.are.equal(sut, "D")
		end)

		it("sets jump", function()
			local sut = instruction:jump()
			assert.are.equal(sut, "JMP")
		end)
	end)

	describe("D=A+1;JQE", function()
		local instruction = nil
		setup(function()
			instruction = Instruction.new("D=A+1;JQE")
		end)

		it("sets dest", function()
			local sut = instruction:destination()
			assert.are.equal(sut, "D")
		end)

		it("sets comp", function()
			local sut = instruction:comp()
			assert.are.equal(sut, "A+1")
		end)

		it("sets jump", function()
			local sut = instruction:jump()
			assert.are.equal(sut, "JQE")
		end)
	end)

	describe("0;JQE", function()
		local instruction = nil
		setup(function()
			instruction = Instruction.new("0;JQE")
		end)

		it("sets dest", function()
			local sut = instruction:destination()
			assert.is_nil(sut)
		end)

		it("sets comp", function()
			local sut = instruction:comp()
			assert.are.equal(sut, "0")
		end)

		it("sets jump", function()
			local sut = instruction:jump()
			assert.are.equal(sut, "JQE")
		end)
	end)
end)
