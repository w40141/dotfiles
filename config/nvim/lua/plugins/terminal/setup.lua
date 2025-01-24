local M = {}

function M.toggleterm()
	vim.keymap.set(
		{ "n", "t" },
		"<Space>l",
		"<CMD>ToggleTerm direction=float<CR>",
		{ desc = "[toggleterm] ターミナルをトグル" }
	)
end

return M
