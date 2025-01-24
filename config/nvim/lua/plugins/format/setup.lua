local M = {}

function M.conform()
	local v = vim
	local key = v.keymap.set
	v.o.formatexpr = "v:lua.require'conform'.formatexpr()"

	key("n", "[dev]f", function()
		require("conform").format({ async = true, lsp_fallback = true })
	end, { desc = "[conform] フォーマット" })
end

return M
