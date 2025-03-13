local M = {}

function M.conform()
	local v = vim
	local key = v.keymap.set
	v.o.formatexpr = "v:lua.require'conform'.formatexpr()"

	key("n", "[DEV]f", function()
		require("conform").format({ async = true, lsp_fallback = true })
	end, { desc = "[conform] フォーマット" })
end

return M
