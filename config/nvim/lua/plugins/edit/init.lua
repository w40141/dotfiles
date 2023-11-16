local setup = require("plugins.edit.setup")
local conf = require("plugins.edit.config")

return {
	{
		-- A better annotation generator.
		-- Supports multiple languages and annotation conventions.
		url = "https://github.com/danymat/neogen",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		init = setup.neogen,
		config = conf.neogen,
	},
	-- {
	-- 	-- Add/change/delete surrounding delimiter pairs with ease.
	-- 	url = "https://github.com/kylechui/nvim-surround",
	-- 	config = conf.nvim_surround,
	-- 	event = "VeryLazy",
	-- },
	{
		-- A surround text object plugin for neovim written in lua.
		url = "https://github.com/ur4ltz/surround.nvim",
		config = conf.surround,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		-- eskk is pure Vim script implementation of input method engine SKK
		url = "https://github.com/vim-skk/eskk.vim",
		init = setup.eskk,
		config = conf.eskk,
		event = { "InsertEnter" },
	},
	{
		-- Comment out
		url = "https://github.com/numToStr/Comment.nvim",
		config = conf.comment,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		-- Colorizer
		url = "https://github.com/norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = conf.colorizer,
	},
	{
		-- TODO: cmpと連携させる
		-- Improved Yank and Put functionalities for Neovim
		url = "https://github.com/gbprod/yanky.nvim",
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
