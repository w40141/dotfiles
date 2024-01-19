local setup = require("plugins.edit.setup")
local conf = require("plugins.edit.config")

return {
	{
		-- A better annotation generator.
		-- Supports multiple languages and annotation conventions.
		"danymat/neogen",
		-- url = "https://github.com/danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		init = setup.neogen,
		config = conf.neogen,
		cmd = { "Neogen" },
		keys = {
			{ "<C-l>", mode = "i" },
			{ "<C-h>", mode = "i" },
			{ ",n", mode = "n" },
		},
	},
	{
		-- Add/change/delete surrounding delimiter pairs with ease.
		"kylechui/nvim-surround",
		-- url = "https://github.com/kylechui/nvim-surround",
		version = "*",
		config = conf.nvim_surround,
		event = "VeryLazy",
	},
	-- {
	-- 	-- A surround text object plugin for neovim written in lua.
	-- 	"ur4ltz/surround.nvim",
	-- 	-- url = "https://github.com/ur4ltz/surround.nvim",
	-- 	config = conf.surround,
	-- 	event = { "BufReadPre", "FocusLost", "CursorHold" },
	-- },
	{
		-- eskk is pure Vim script implementation of input method engine SKK
		"vim-skk/eskk.vim",
		-- url = "https://github.com/vim-skk/eskk.vim",
		init = setup.eskk,
		config = conf.eskk,
		event = { "InsertEnter" },
	},
	{
		-- Comment out
		"numToStr/Comment.nvim",
		-- url = "https://github.com/numToStr/Comment.nvim",
		config = conf.comment,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		-- Colorizer
		"norcalli/nvim-colorizer.lua",
		-- url = "https://github.com/norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = conf.colorizer,
	},
	{
		-- Improved Yank and Put functionalities for Neovim
		"gbprod/yanky.nvim",
		-- url = "https://github.com/gbprod/yanky.nvim",
		keys = {
			{ "<Plug>(YankyCycleBackward)", mode = "n" },
			{ "<Plug>(YankyCycleForward)", mode = "n" },
			{ "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
			{ "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
			{ "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
			{ "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
		},
		cmd = { "YankyRingHistory" },
		init = setup.yanky,
		config = conf.yanky,
	},
}
