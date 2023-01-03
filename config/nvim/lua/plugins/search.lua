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
				setup = require("rc.setup.trouble-nvim"),
				config = require("rc.config.trouble-nvim"),
			},
			{ "stevearc/aerial.nvim", module = { "aerial" } },
		},
		wants = { "trouble.nvim", "aerial.nvim" },
		setup = require("rc.setup.telescope-nvim"),
		config = require("rc.config.telescope-nvim"),
	},
	{
		-- quickly highlight <cword> or visually selected word
		-- https://github.com/t9md/vim-quickhl
		"t9md/vim-quickhl",
		keys = {
			{ "n", "<Plug>(quickhl-manual-this)" },
			{ "n", "<Plug>(quickhl-manual-reset)" },
		},
		setup = require("rc.setup.vim-quickhl"),
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
		setup = require("rc.setup.nvim-hlslens"),
		config = function()
			require("hlslens").setup()
		end,
	},
}
