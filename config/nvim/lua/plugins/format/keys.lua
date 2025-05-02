local M = {}

M.conform = {
	{
		"[DEV]f",
		function()
			require("conform").format({ async = true, lsp_fallback = true })
		end,
		{ desc = "[conform] フォーマット" },
	},
}

return M
