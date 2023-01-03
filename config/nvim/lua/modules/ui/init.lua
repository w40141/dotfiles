return {
	{
		-- https://github.com/rebelot/kanagawa.nvim
		"rebelot/kanagawa.nvim",
		config = require("rc.config.kanagawa"),
	},
	{
		-- Greeter
		-- https://github.com/goolord/alpha-nvim
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		wants = { "nvim-web-devicons" },
		event = "BufWinEnter",
		config = require("rc.config.alpha-nvim"),
	},
	{
		-- https://github.com/stevearc/aerial.nvim
		"stevearc/aerial.nvim",
		module = { "aerial" },
		cmd = { "Aerial" },
		setup = require("rc.setup.aerial-nvim"),
		config = require("rc.config.aerial-nvim"),
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
		setup = require("rc.setup.bufferline-nvim"),
		config = require("rc.config.bufferline-nvim"),
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
		setup = function()
			require("rc.setup.lualine")
		end,
		config = require("rc.config.lualine-nvim"),
	},
	{
		-- Indent guide
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		event = {
			"BufReadPost",
		},
		config = require("rc.config.indent-blankline-nvim"),
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
				config = require("rc.config.nvim-notify"),
			},
		},
		wants = { "nvim-treesitter" },
		setup = require("rc.setup.noice-nvim"),
		config = require("rc.config.noice-nvim"),
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
		config = function()
			require("scrollbar").setup({})
		end,
	},
	{
		-- https://github.com/lewis6991/gitsigns.nvim
		"lewis6991/gitsigns.nvim",
		event = { "FocusLost", "CursorHold" },
		config = require("rc.config.gitsigns-nvim"),
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
		setup = require("rc.setup.lir-nvim"),
		config = require("rc.config.lir-nvim"),
	},
}
