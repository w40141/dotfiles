local conf = require("plugins.ui.config")
local setup = require("plugins.ui.setup")

return {
	{
		"rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		config = conf.kanagawa,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufWinEnter",
		config = conf.alpha,
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "Aerial" },
		init = setup.aerial,
		config = conf.aerial,
	},
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		event = { "BufReadPre" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"rebelot/kanagawa.nvim",
			"stevearc/aerial.nvim",
		},
		init = setup.lualine,
		config = conf.lualine,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost" },
		config = conf.indent_blankline,
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		{ "rcarriga/nvim-notify", config = conf.notify },
	-- 	},
	-- 	init = setup.noice,
	-- 	config = conf.noice,
	-- },
	{
		-- Scrollbar
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
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost" },
		config = conf.gitsigns,
	},
	{
		-- File finder
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setup.nvimTree,
		config = conf.nvimTree,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
		config = conf.dressing,
	},
}
