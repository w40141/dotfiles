local conf = require("modules.search.config")
local setup = require("modules.search.setup")

return {
	{
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
		-- quickly highlight <cword> or visually selected word
		-- https://github.com/t9md/vim-quickhl
		"t9md/vim-quickhl",
		keys = {
			{ "n", "<Plug>(quickhl-manual-this)" },
			{ "n", "<Plug>(quickhl-manual-reset)" },
		},
		setup = setup.quickhl,
	},
	{
		-- Highlight length of search result
		-- https://github.com/kevinhwang91/nvim-hlslens
		"kevinhwang91/nvim-hlslens",
		keys = { { "n", "*" }, { "n", "g*" }, { "n", "g*" } },
		event = { "CmdlineEnter" },
		module = { "hlslens" },
		requires = {
			-- https://github.com/rapan931/lasterisk.nvim
			"rapan931/lasterisk.nvim",
			module = { "lasterisk" },
		},
		wants = { "lasterisk.nvim" },
		setup = setup.hlslens,
		config = conf.hlslens,
	},
}
