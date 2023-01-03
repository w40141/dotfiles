local conf = require("modules.ui.config")
local setup = require("modules.ui.setup")

return {
	{
		-- https://github.com/rebelot/kanagawa.nvim
		"rebelot/kanagawa.nvim",
		config = conf.kanagawa,
	},
	{
		-- Greeter
		-- https://github.com/goolord/alpha-nvim
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		wants = { "nvim-web-devicons" },
		event = "BufWinEnter",
		config = conf.alpha,
	},
	{
		-- https://github.com/stevearc/aerial.nvim
		"stevearc/aerial.nvim",
		module = { "aerial" },
		cmd = { "Aerial" },
		setup = setup.aerial,
		config = conf.aerial,
	},
	{
		-- Buffer line
		-- https://github.com/akinsho/bufferline.nvim
		"akinsho/bufferline.nvim",
		event = {
			"BufReadPost",
		},
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
		},
		wants = { "nvim-web-devicons" },
		setup = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Status line
		-- https://github.com/nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		event = {
			"BufReadPre",
		},
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
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		event = {
			"BufReadPost",
		},
		-- config = require("rc.config.indent-blankline-nvim"),
		config = conf.indnt_blankline,
	},
	{
		-- A fancy, configurable, notification manager for NeoVim
		-- https://github.com/folke/noice.nvim
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
				-- https://github.com/rcarriga/nvim-notify
				"rcarriga/nvim-notify",
				module = { "notify" },
				config = conf.notify,
			},
		},
		wants = { "nvim-treesitter" },
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
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = conf.scrollbar,
	},
	{
		-- https://github.com/lewis6991/gitsigns.nvim
		"lewis6991/gitsigns.nvim",
		event = { "FocusLost", "CursorHold" },
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
