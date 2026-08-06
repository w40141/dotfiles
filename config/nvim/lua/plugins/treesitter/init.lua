local conf = require("plugins.treesitter.config")
local keys = require("plugins.treesitter.keys")

return {
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		-- url = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = conf.treesitter,
		-- opts = opts.treesitter,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		lazy = false,
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = conf.treesitter_textobjects,
		keys = keys.treesitter_textobjects,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		-- url = https://github.com/nvim-treesitter/nvim-treesitter-context
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
