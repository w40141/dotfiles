local conf = require("plugins.ui.config")
local setup = require("plugins.ui.setup")

return {
	{
		url = "https://github.com/rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		config = conf.kanagawa,
	},
	{
		url = "https://github.com/goolord/alpha-nvim",
		dependencies = {
			{
				url = "https://github.com/nvim-tree/nvim-web-devicons",
			},
		},
		event = "BufWinEnter",
		config = conf.alpha,
	},
	{
		url = "https://github.com/stevearc/aerial.nvim",
		cmd = { "Aerial" },
		init = setup.aerial,
		config = conf.aerial,
	},
	{
		-- Buffer line
		url = "https://github.com/akinsho/bufferline.nvim",
		event = { "BufReadPre" },
		dependencies = {
			{
				url = "https://github.com/nvim-tree/nvim-web-devicons",
			},
		},
		init = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Status line
		url = "https://github.com/nvim-lualine/lualine.nvim",
		event = { "BufReadPre" },
		dependencies = {
			{
				url = "https://github.com/nvim-tree/nvim-web-devicons",
			},
			{
				url = "https://github.com/rebelot/kanagawa.nvim",
			},
			{
				url = "https://github.com/stevearc/aerial.nvim",
			},
		},
		init = setup.lualine,
		config = conf.lualine,
	},
	{
		url = "https://github.com/lukas-reineke/indent-blankline.nvim",
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
		url = "https://github.com/petertriho/nvim-scrollbar",
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
		url = "https://github.com/lewis6991/gitsigns.nvim",
		event = { "BufReadPost" },
		config = conf.gitsigns,
	},
	{
		-- File finder
		url = "https://github.com/nvim-tree/nvim-tree.lua",
		dependencies = {
			url = "https://github.com/nvim-tree/nvim-web-devicons",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setup.nvimTree,
		config = conf.nvimTree,
	},
	{
		url = "https://github.com/stevearc/dressing.nvim",
		opts = {},
		config = conf.dressing,
	},
}
