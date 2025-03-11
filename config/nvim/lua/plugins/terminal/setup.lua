local M = {}

function M.toggleterm()
	vim.keymap.set(
		{ "n", "t" },
		"<leader>l",
		"<CMD>ToggleTerm direction=float<CR>",
		{ desc = "[toggleterm] ターミナルをトグル" }
	)
end

return M
