local conf = require("plugins.ui.config")
local setup = require("plugins.ui.setup")

return {
	{
		"nvim-tree/nvim-web-devicons",
		-- url = "https://github.com/nvim-tree/nvim-web-devicons",
	},
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		config = conf.kanagawa,
	},
	{
		"goolord/alpha-nvim",
		-- url = "https://github.com/goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "BufWinEnter",
		config = conf.alpha,
	},
	{
		"stevearc/aerial.nvim",
		-- url = "https://github.com/stevearc/aerial.nvim",
		cmd = { "Aerial" },
		init = setup.aerial,
		config = conf.aerial,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		-- url = "https://github.com/akinsho/bufferline.nvim",
		event = { "BufReadPre" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		-- url = "https://github.com/nvim-lualine/lualine.nvim",
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
		-- url = "https://github.com/lukas-reineke/indent-blankline.nvim",
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
		-- url = "https://github.com/petertriho/nvim-scrollbar",
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
		-- File finder
		"nvim-tree/nvim-tree.lua",
		-- url = "https://github.com/nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setup.nvimTree,
		config = conf.nvimTree,
	},
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	-- url = "https://github.com/stevearc/dressing.nvim",
	-- 	opts = {},
	-- 	config = conf.dressing,
	-- },
	{
		"folke/zen-mode.nvim",
		opts = {},
		cmd = { "ZenMode" },
	},
}
