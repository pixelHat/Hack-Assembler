require("busted.runner")()

describe("Busted unit testing framework", function()
	it("first", function()
		assert.are.same({ table = "great" }, { table = "great" })
	end)
end)
