local M = {}

function M.conform()
	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
