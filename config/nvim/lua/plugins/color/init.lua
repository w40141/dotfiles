local conf = require("plugins.color.config")
-- local setup = require("plugins.color.setup")

return {
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		config = conf.kanagawa,
		lazy = false,
		priority = 1000,
		event = "VeryLazy",
	},
	{
		"folke/tokyonight.nvim",
		-- url = "https://github.com/folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		event = "VeryLazy",
	},
	{
		"scottmckendry/cyberdream.nvim",
		-- url = "https://github.com/scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		event = "VeryLazy",
	},
	{
		"olimorris/onedarkpro.nvim",
		-- url = "https://github.com/olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		event = "VeryLazy",
	},
}
