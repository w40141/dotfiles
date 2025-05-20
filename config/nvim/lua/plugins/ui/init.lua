local conf = require("plugins.ui.config")
local opts = require("plugins.ui.opts")
local setup = require("plugins.ui.setup")
local keys = require("plugins.ui.keys")

return {
	{
		"nvim-tree/nvim-web-devicons",
		-- url = "https://github.com/nvim-tree/nvim-web-devicons",
	},
	{
		"goolord/alpha-nvim",
		-- url = "https://github.com/goolord/alpha-nvim",
		event = "VimEnter",
		config = conf.alpha,
	},
	{
		-- Status line
		"nvim-lualine/lualine.nvim",
		-- url = "https://github.com/nvim-lualine/lualine.nvim",
		event = "VimEnter",
		init = setup.lualine,
		opts = opts.lualine,
	},
	{
		-- highlight indent line and the current chunk (context) cursor stayed
		"shellRaining/hlchunk.nvim",
		-- url = "https://github.com/shellRaining/hlchunk.nvim"
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			chunk = {
				enable = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "┌",
					left_bottom = "└",
					right_arrow = ">",
				},
				style = "#806d9c",
			},
			indent = {
				enable = true,
				chars = { "│", "¦", "┆", "┊" },
				use_treesitter = true,
			},
			line_num = {
				enable = false,
			},
		},
	},
	{
		-- Scrollbar
		"petertriho/nvim-scrollbar",
		-- url = "https://github.com/petertriho/nvim-scrollbar",
		event = { "VeryLazy" },
		opts = {},
	},
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		-- url = "https://github.com/akinsho/bufferline.nvim",
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		opts = opts.bufferline,
		keys = keys.bufferline,
	},
	{
		-- Neovim plugin for a code outline window
		"stevearc/aerial.nvim",
		-- url = "https://github.com/stevearc/aerial.nvim",
		cmd = { "Aerial" },
		opts = opts.aerial,
		keys = keys.aerial,
	},
	{
		-- File finder
		"nvim-tree/nvim-tree.lua",
		-- url = "https://github.com/nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		config = conf.tree,
		keys = keys.tree,
	},
}
