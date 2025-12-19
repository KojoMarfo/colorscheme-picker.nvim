local M = {}

function M.get_user_schemes()
	local vimruntime = vim.env.VIMRUNTIME
	local seen = {}
	local schemes = {}

	for _, name in ipairs(vim.fn.getcompletion("", "color")) do
		local files = vim.api.nvim_get_runtime_file("colors/" .. name .. ".*", false)

		local path = files[1]

		if not vim.startswith(path, vimruntime) and not seen[name] then
			seen[name] = true
			table.insert(schemes, name)
		end
	end

	table.sort(schemes)
	return schemes
end

function M.get_all_schemes()
	local seen = {}
	local schemes = {}

	for _, name in ipairs(vim.fn.getcompletion("", "color")) do
		if not seen[name] then
			seen[name] = true
			table.insert(schemes, name)
		end
	end

	table.sort(schemes)
	return schemes
end

return M
