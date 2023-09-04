local conf = require("modulesTmp.ui.config")
local setup = require("modulesTmp.ui.setup")

return {
	{
		"rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		-- config = conf.kanagawa,
		config = function()
			require("kanagawa").setup({})

			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
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
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		init = setup.bufferline,
		config = conf.bufferline,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPre" },
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "rebelot/kanagawa.nvim" },
			{ "stevearc/aerial.nvim" },
		},
		init = setup.lualine,
		config = conf.lualine,
	},
	{
		-- Indent guide
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost" },
		config = conf.indent_blankline,
	},
	-- {
	--   -- A fancy, configurable, notification manager for NeoVim
	--   "folke/noice.nvim",
	--   event = {
	--     "BufRead",
	--     "BufNewFile",
	--     "InsertEnter",
	--     "CmdlineEnter",
	--     "CursorHold",
	--     "FocusLost",
	--   },
	--   module = { "noice" },
	--   dependencies = {
	--     { "MunifTanjim/nui.nvim" },
	--     {
	--       "rcarriga/nvim-notify",
	--       module = { "notify" },
	--       config = conf.notify,
	--     },
	--   },
	--   setup = setup.noice,
	--   config = conf.noice,
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
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setup.nvimTree,
		config = conf.nvimTree,
	},
}
