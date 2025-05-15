local M = {}

M.toggleterm = {
	{
		"<leader>l",
		"<cmd>ToggleTerm direction=float<cr>",
		{
			mode = { "n", "t" },
			desc = "[toggleterm] ターミナルをトグル",
		},
	},
}

return M
