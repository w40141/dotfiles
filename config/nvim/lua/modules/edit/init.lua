local setup = require("modules.edit.setup")
local conf = require("modules.edit.config")

return {
	{
		-- Highlight, list and search todo comments
		-- https://github.com/folke/todo-comments.nvim
		"folke/todo-comments.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		requires = { "nvim-lua/plenary.nvim" },
		wants = { "plenary.nvim" },
		setup = setup.todo_comments(),
		config = conf.todo_comments(),
	},
	{
		-- Annotation generator
		-- https://github.com/danymat/neogen
		"danymat/neogen",
		requires = { "nvim-treesitter/nvim-treesitter" },
		module = { "neogen" },
		wants = { "nvim-treesitter" },
		setup = setup.neogen(),
		config = conf.neogen(),
	},
	{
		-- A surround text object plugin for neovim written in lua.
		-- https://github.com/ur4ltz/surround.nvim
		"ur4ltz/surround.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = conf.surround(),
	},
	{
		-- engine SKK
		-- https://github.com/tyru/eskk.vim
		"tyru/eskk.vim",
		keys = {
			{ "i", "<Plug>(eskk:toggle)" },
			{ "c", "<Plug>(eskk:toggle)" },
		},
		setup = setup.eskk(),
		config = conf.eskk(),
	},
	{
		-- Comment out
		-- https://github.com/numToStr/Comment.nvim
		"numToStr/Comment.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = conf.comment(),
	},
	{
		-- Colorizer
		-- https://github.com/norcalli/nvim-colorizer.lua
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		-- config = conf.colorizer(),
		config = function()
			require("colorizer").setup({})
		end,
	},
	{
		-- Use Neovim as a language server to inject LSP diagnostics, code actions
		-- https://github.com/jose-elias-alvarez/null-ls.nvim
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = { "CursorHold", "FocusLost" },
		config = conf.null_ls(),
	},
}
