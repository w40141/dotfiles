local M = {}

M.conform = {
	{
		"[DEV]f",
		function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end,
		desc = "[conform] フォーマット",
	},
}

return M
