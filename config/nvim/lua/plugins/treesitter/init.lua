local conf = require("plugins.treesitter.config")

return {
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		-- url = "https://github.com/nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- event = "VeryLazy",
		-- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		event = { "BufRead" },
		config = conf.treesitter,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		-- url = https://github.com/nvim-treesitter/nvim-treesitter-context
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
		-- event = "VeryLazy",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
	{
		"m-demare/hlargs.nvim",
		-- url = "https://github.com/m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
		config = conf.hlargs,
	},
	{
		"andersevenrud/nvim_context_vt",
		-- url = "https://github.com/andersevenrud/nvim_context_vt",
		config = conf.context,
		event = { "BufNewFile", "BufRead" },
	},
}
