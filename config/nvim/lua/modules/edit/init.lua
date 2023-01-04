local setup = require("modules.edit.setup")
local conf = require("modules.edit.config")

local function e(p)
	p.event = {
		"InsertEnter",
		"CursorHold",
		"FocusLost",
		"BufRead",
		"BufNewFile",
	}
	return p
end

local function i(p)
	p.event = { "InsertEnter" }
	return p
end

return {
	e({
		-- Highlight, list and search todo comments
		-- https://github.com/folke/todo-comments.nvim
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		wants = { "plenary.nvim" },
		setup = setup.todo_comments,
		config = conf.todo_comments,
	}),
	{
		-- Annotation generator
		-- https://github.com/danymat/neogen
		"danymat/neogen",
		requires = { "nvim-treesitter/nvim-treesitter" },
		module = { "neogen" },
		wants = { "nvim-treesitter" },
		setup = setup.neogen,
		config = conf.neogen,
	},
	e({
		-- A surround text object plugin for neovim written in lua.
		-- https://github.com/ur4ltz/surround.nvim
		"ur4ltz/surround.nvim",
		config = conf.surround,
	}),
	i({
		-- engine SKK
		-- https://github.com/tyru/eskk.vim
		"tyru/eskk.vim",
		keys = {
			{ "i", "<Plug>(eskk:toggle)" },
			{ "c", "<Plug>(eskk:toggle)" },
		},
		setup = setup.eskk,
		config = conf.eskk,
	}),
	e({
		-- Comment out
		-- https://github.com/numToStr/Comment.nvim
		"numToStr/Comment.nvim",
		config = conf.comment,
	}),
	{
		-- Colorizer
		-- https://github.com/norcalli/nvim-colorizer.lua
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = conf.colorizer,
	},
	e({
		-- Use Neovim as a language server to inject LSP diagnostics, code actions
		-- https://github.com/jose-elias-alvarez/null-ls.nvim
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = conf.null_ls,
	}),
}
