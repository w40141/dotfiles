local conf = require("plugins.treesitter.config")

return {
	{
		-- Treesitter configurations
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = conf.treesitter,
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	{
		"yioneko/nvim-yati",
		event = { "BufNewFile", "BufRead" },
	},
	{
		"m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
	},
	-- e({"mrjones2014/nvim-ts-rainbow"}),
	-- e({ "p00f/nvim-ts-rainbow" }),
	{
		"haringsrob/nvim_context_vt",
		config = conf.context_vt,
		event = { "BufNewFile", "BufRead" },
	},
}
