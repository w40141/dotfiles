local setup = require("plugins.edit.setup")
local conf = require("plugins.edit.config")

return {
	{
		-- Annotation generator
		"danymat/neogen",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		init = setup.neogen,
		config = conf.neogen,
	},
	{
		-- A surround text object plugin for neovim written in lua.
		"ur4ltz/surround.nvim",
		config = conf.surround,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		-- engine SKK
		"tyru/eskk.vim",
		init = setup.eskk,
		config = conf.eskk,
		event = { "InsertEnter" },
	},
	{
		-- Comment out
		"numToStr/Comment.nvim",
		config = conf.comment,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		-- Colorizer
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = conf.colorizer,
	},
	{
		-- Use Neovim as a language server to inject LSP diagnostics, code actions
		"jose-elias-alvarez/null-ls.nvim",
		event = { "FocusLost", "CursorHold" },
		dependencies = "nvim-lua/plenary.nvim",
		config = conf.null_ls,
	},
	{
		"gbprod/yanky.nvim",
		dependencies = { "stevearc/dressing.nvim", opt = true },
		keys = {
			{ "<Plug>(YankyCycleBackward)", mode = "n" },
			{ "<Plug>(YankyCycleForward)", mode = "n" },
			{ "<Plug>(YankyGPutAfter)", mode = "n" },
			{ "<Plug>(YankyGPutBefore)", mode = "n" },
			{ "<Plug>(YankyPutAfter)", mode = "n" },
			{ "<Plug>(YankyPutBefore)", mode = "n" },
			{ "<Plug>(YankyGPutAfter)", mode = "x" },
			{ "<Plug>(YankyGPutBefore)", mode = "x" },
			{ "<Plug>(YankyPutAfter)", mode = "x" },
			{ "<Plug>(YankyPutBefore)", mode = "x" },
		},
		cmd = { "YankyRingHistory" },
		init = setup.yanky,
		config = conf.yanky,
	},
}
