local conf = require("plugins.treesitter.config")

return {
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		-- url = "https://github.com/nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = conf.treesitter,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				-- url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		-- dependencies = {
		-- 	{
		-- 		url = "https://github.com/nvim-treesitter/nvim-treesitter",
		-- 	},
		-- },
	},
	{
		"yioneko/nvim-yati",
		-- url = "https://github.com/yioneko/nvim-yati",
		event = { "BufNewFile", "BufRead" },
	},
	{
		"m-demare/hlargs.nvim",
		-- url = "https://github.com/m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
	},
	{
		"andersevenrud/nvim_context_vt",
		-- url = "https://github.com/andersevenrud/nvim_context_vt",
		config = conf.context_vt,
		event = { "BufNewFile", "BufRead" },
	},
}
