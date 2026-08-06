return {
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
		opts = {
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		},
		-- lazy = false,
		-- event = "VimEnter",
	},
}
