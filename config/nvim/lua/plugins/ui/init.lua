local conf = require("plugins.ui.config")
local setup = require("plugins.ui.setup")

return {
	{
		"nvim-tree/nvim-web-devicons",
		-- url = "https://github.com/nvim-tree/nvim-web-devicons",
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
		-- Status line
		"nvim-lualine/lualine.nvim",
		-- url = "https://github.com/nvim-lualine/lualine.nvim",
		-- event = { "VeryLazy" },
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"rebelot/kanagawa.nvim",
			"stevearc/aerial.nvim",
		},
		init = setup.lualine,
		config = conf.lualine,
	},
	{
		-- highlight indent line and the current chunk (context) cursor stayed
		"shellRaining/hlchunk.nvim",
		-- url = "https://github.com/shellRaining/hlchunk.nvim"
		event = { "BufReadPost" },
		config = conf.hlchunk,
	},
	{
		-- Scrollbar
		"petertriho/nvim-scrollbar",
		-- url = "https://github.com/petertriho/nvim-scrollbar",
		event = { "VeryLazy" },
		config = conf.scrollbar,
	},
	{
		-- Buffer line
		"akinsho/bufferline.nvim",
		-- url = "https://github.com/akinsho/bufferline.nvim",
		-- event = { "VeryLazy" },
		-- event = "BufWinEnter",
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = setup.bufferline,
		config = conf.bufferline,
	},
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		config = conf.kanagawa,
		event = { "VimEnter" },
	},
	{
		-- Neovim plugin for a code outline window
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
		-- File finder
		"nvim-tree/nvim-tree.lua",
		-- url = "https://github.com/nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
		init = setup.tree,
		config = conf.tree,
	},
}
