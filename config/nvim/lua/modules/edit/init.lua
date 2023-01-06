local setup = require("modules.edit.setup")
local conf = require("modules.edit.config")

local function e(p)
	p.event = {
		-- "InsertEnter",
		-- "CursorHold",
		-- "FocusLost",
		-- "BufRead",
		-- "BufNewFile",
		"BufReadPre",
	}
	return p
end

local function i(p)
	p.event = { "InsertEnter" }
	return p
end

return {
	{
		-- Annotation generator
		"danymat/neogen",
		requires = { "nvim-treesitter/nvim-treesitter" },
		module = { "neogen" },
		wants = { "nvim-treesitter" },
		setup = setup.neogen,
		config = conf.neogen,
	},
	e({
		-- A surround text object plugin for neovim written in lua.
		"ur4ltz/surround.nvim",
		config = conf.surround,
	}),
	i({
		-- engine SKK
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
		"numToStr/Comment.nvim",
		config = conf.comment,
	}),
	{
		-- Colorizer
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = conf.colorizer,
	},
	e({
		-- Use Neovim as a language server to inject LSP diagnostics, code actions
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = conf.null_ls,
	}),
}
