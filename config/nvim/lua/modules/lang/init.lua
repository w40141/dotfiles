local conf = require("modules.lang.config")

return {
	{
		-- Automatically uppercase SQL keywords
		-- https://github.com/jsborjesson/vim-uppercase-sql
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
	},
	{
		"previm/previm",
		ft = { "markdown" },
		config = conf.previm,
	},
	{
		-- TODO: https://github.com/kevinhwang91/nvim-bqf
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	-- {
	-- 	-- https://github.com/simrat39/rust-tools.nvim
	-- 	"simrat39/rust-tools.nvim",
	-- 	ft = "rust",
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = conf.rust,
	-- },
}
