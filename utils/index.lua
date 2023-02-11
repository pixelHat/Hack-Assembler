local M = {}

M.trim = function(str)
	return str:gsub("%s+", "")
end

M.print_table = function(table)
	for k, v in pairs(table) do
		print(k, v)
	end
end

M.pipe = function(functions, args)
	local result = table.unpack(args)
	for _, fn in pairs(functions) do
		result = fn(result)
	end
	return result
end

return M
