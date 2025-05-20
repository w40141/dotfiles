-- local opts = require("plugins.treesitter.opts")
local conf = require("plugins.treesitter.config")

return {
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		-- url = "https://github.com/nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufRead" },
		config = conf.treesitter,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		-- url = https://github.com/nvim-treesitter/nvim-treesitter-context
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
	{
		"m-demare/hlargs.nvim",
		-- url = "https://github.com/m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
		opts = {},
	},
	{
		"andersevenrud/nvim_context_vt",
		-- url = "https://github.com/andersevenrud/nvim_context_vt",
		opts = {
			enabled = true,
			disable_virtual_lines_ft = { "python", "yaml" },
		},
		event = { "BufNewFile", "BufRead" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"windwp/nvim-ts-autotag",
		-- url = "https://github.com/windwp/nvim-ts-autotag"
		event = { "InsertEnter" },
		opts = {},
	},
}
