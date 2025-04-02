local M = {}

function M.kanagawa()
	require("kanagawa").setup({
		theme = "dragon",
		background = {
			dark = "dragon",
			light = "lotus",
		},
	})
	vim.cmd("colorscheme kanagawa")
end

return M
