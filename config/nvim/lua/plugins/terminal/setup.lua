local M = {}

function M.toggleterm()
	vim.keymap.set(
		{ "n", "t" },
		"<leader>l",
		"<cmd>ToggleTerm direction=float<cr>",
		{ desc = "[toggleterm] ターミナルをトグル" }
	)
end

return M
