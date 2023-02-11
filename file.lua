local utils = require("utils.index")
local M = {}

local function remove_labels(symbol_table)
	return function(text)
		local current_line_with_code = 0
		local without_labels = {}
		for _, l in pairs(text) do
			if string.sub(l, 1, 1) == "(" then
				local label_name = string.sub(l, 2, #l - 1)
				symbol_table:add_label(label_name, current_line_with_code)
			else
				table.insert(without_labels, l)
				current_line_with_code = current_line_with_code + 1
			end
		end
		return without_labels
	end
end

local function remove_comentaries(text)
	local without_comentaries = {}
	for _, l in pairs(text) do
		local start_of_comentary = l:find("//")
		if start_of_comentary then
			local line_without_comentary = string.sub(l, 1, start_of_comentary - 1)
			table.insert(without_comentaries, line_without_comentary)
		else
			table.insert(without_comentaries, l)
		end
	end
	return without_comentaries
end

local function remove_empty_lines(text)
	local without_emptpy_lines = {}
	for _, l in pairs(text) do
		if not (l == "") then
			local trimed = l --:gsub("%s+", "")
			table.insert(without_emptpy_lines, trimed)
		end
	end
	return without_emptpy_lines
end

local function remove_whitespaces(text)
	local without_whitespaces = {}
	for _, l in pairs(text) do
		if string.len(l) > 1 then
			table.insert(without_whitespaces, l)
		end
	end
	return without_whitespaces
end

local function trim_lines(text)
	local trimed = {}
	for line in text do
		local trimed_line = utils.trim(line)
		table.insert(trimed, trimed_line)
	end
	return trimed
end

function M.open_file(name, symbol_table)
	local file = io.open(name, "r")
	if not file then
		return nil
	end
	local functions = {
		trim_lines,
		remove_empty_lines,
		remove_comentaries,
		remove_whitespaces,
		remove_labels(symbol_table),
	}
	return utils.pipe(functions, { file:lines() })
end

function M.save_file(name, text)
	local file = io.open(name, "w")
	if not file then
		return nil
	end
	for _, l in pairs(text) do
		file:write(l .. "\n")
	end
	file:close()
end

return M
