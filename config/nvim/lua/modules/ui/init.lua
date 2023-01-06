local conf = require("modules.ui.config")
local setup = require("modules.ui.setup")

return {
	{ "rebelot/kanagawa.nvim" },
	{
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		wants = { "nvim-web-devicons" },
		event = "BufWinEnter",
		config = conf.alpha,
	},
	{
		"stevearc/aerial.nvim",
		module = { "aerial" },
		cmd = { "Aerial" },
		setup = setup.aerial,
		config = conf.aerial,
	},
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		event = { "BufReadPre" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
		},
		wants = { "nvim-web-devicons" },
		setup = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
			{ "rebelot/kanagawa.nvim" },
			{ "stevearc/aerial.nvim", module = { "aerial" } },
		},
		wants = { "nvim-web-devicons", "kanagawa.nvim", "aerial.nvim" },
		setup = setup.lualine,
		config = conf.lualine,
	},
	{
		-- Indent guide
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost" },
		-- config = require("rc.config.indent-blankline-nvim"),
		config = conf.indnt_blankline,
	},
	{
		-- A fancy, configurable, notification manager for NeoVim
		"folke/noice.nvim",
		event = {
			"BufRead",
			"BufNewFile",
			"InsertEnter",
			"CmdlineEnter",
			"CursorHold",
			"FocusLost",
		},
		module = { "noice" },
		requires = {
			{ "MunifTanjim/nui.nvim" },
			{
				"rcarriga/nvim-notify",
				module = { "notify" },
				config = conf.notify,
			},
		},
		-- wants = { "nvim-treesitter" },
		-- setup = require("rc.setup.noice-nvim"),
		-- config = require("rc.config.noice-nvim"),
		setup = setup.noice,
		config = conf.noice,
	},
	{
		-- Scrollbar
		-- https://github.com/petertriho/nvim-scrollbar
		"petertriho/nvim-scrollbar",
		event = {
			"BufRead",
			"BufNewFile",
			"InsertEnter",
			"CmdlineEnter",
			"CursorHold",
			"FocusLost",
		},
		config = conf.scrollbar,
	},
	{
		-- https://github.com/lewis6991/gitsigns.nvim
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost" },
		config = conf.gitsigns,
	},
	{
		-- File finder
		-- https://github.com/tamago324/lir.nvim
		"tamago324/lir.nvim",
		-- },
		module = { "lir.float" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
			{ "nvim-lua/plenary.nvim" },
		},
		wants = { "plenary.nvim", "nvim-web-devicons" },
		setup = setup.lir,
		config = conf.lir,
	},
}
