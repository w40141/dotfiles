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
		setup = require("rc.setup.todo-comments-nvim"),
		config = require("rc.config.todo-comments-nvim"),
	},
	{
		-- Annotation generator
		-- https://github.com/danymat/neogen
		"danymat/neogen",
		requires = { "nvim-treesitter/nvim-treesitter" },
		module = { "neogen" },
		wants = { "nvim-treesitter" },
		setup = require("rc.setup.neogen"),
		config = require("rc.config.neogen"),
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
		config = require("rc.config.surround-nvim"),
	},
	{
		-- https://github.com/windwp/nvim-autopairs
		"windwp/nvim-autopairs",
		module = { "nvim-autopairs" },
		requires = { "hrsh7th/nvim-cmp" },
		want = { "nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		-- engine SKK
		-- https://github.com/tyru/eskk.vim
		"tyru/eskk.vim",
		keys = {
			{ "i", "<Plug>(eskk:toggle)" },
			{ "c", "<Plug>(eskk:toggle)" },
		},
		setup = require("rc.setup.eskk"),
		config = require("rc.config.eskk"),
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
		config = function()
			require("Comment").setup()
		end,
	},
	{
		-- Colorizer
		-- https://github.com/norcalli/nvim-colorizer.lua
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
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
		config = require("rc.config.null-ls-nvim"),
	},
}
