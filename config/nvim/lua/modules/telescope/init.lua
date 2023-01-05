local conf = require("modules.telescope.config")
local setup = require("modules.telescope.setup")

return {
	{
		-- TODO: keymap
		-- Fzf finder
		-- https://github.com/nvim-telescope/telescope.nvim
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		module = { "telescope" },
		requires = {
			{
				-- https://github.com/folke/trouble.nvim
				"folke/trouble.nvim",
				cmd = { "Trouble" },
				module = { "trouble" },
				requires = {
					{
						"kyazdani42/nvim-web-devicons",
						module = { "nvim-web-devicons" },
					},
				},
				wants = { "nvim-web-devicons" },
				setup = setup.trouble,
				config = conf.trouble,
			},
			{ "stevearc/aerial.nvim", module = { "aerial" } },
		},
		wants = { "trouble.nvim", "aerial.nvim" },
		setup = setup.telescope,
		config = conf.telescope,
	},
	{
		"gbprod/yanky.nvim",
		keys = {
			{ "n", "<Plug>(YankyCycleBackward)" },
			{ "n", "<Plug>(YankyCycleForward)" },
			{ "n", "<Plug>(YankyGPutAfter)" },
			{ "n", "<Plug>(YankyGPutBefore)" },
			{ "n", "<Plug>(YankyPutAfter)" },
			{ "n", "<Plug>(YankyPutBefore)" },
			{ "x", "<Plug>(YankyGPutAfter)" },
			{ "x", "<Plug>(YankyGPutBefore)" },
			{ "x", "<Plug>(YankyPutAfter)" },
			{ "x", "<Plug>(YankyPutBefore)" },
		},
		module = { "yanky" },
		requires = { "kkharji/sqlite.lua", opt = true },
		setup = setup.yanky,
		config = conf.yanky,
		wants = { "sqlite.lua" },
	},
	{ "stevearc/dressing.nvim" },
}
