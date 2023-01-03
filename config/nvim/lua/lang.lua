return {
	{
		"previm/previm",
		ft = { "markdown" },
		config = require("rc.config.previm"),
	},
	{
		-- TODO: https://github.com/kevinhwang91/nvim-bqf
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		-- Automatically uppercase SQL keywords
		-- https://github.com/jsborjesson/vim-uppercase-sql
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
	},
}
