local conf = require("modules.treesitter.config")

return {
	{
		-- Treesitter configurations
		-- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile", "InsertEnter" },
		run = ":TSUpdate",
		-- config = require("rc.config.nvim-treesitter"),
		config = conf.treesitter,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	},
	{
		"yioneko/nvim-yati",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	},
	{
		"m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	},
	{
		"p00f/nvim-ts-rainbow",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	},
	{
		"haringsrob/nvim_context_vt",
		event = { "BufNewFile", "BufRead", "FocusLost", "CursorHold" },
		wants = { "nvim-treesitter" },
	},
}
