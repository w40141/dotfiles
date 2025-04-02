local conf = require("plugins.color.config")
-- local setup = require("plugins.color.setup")

return {
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		config = conf.kanagawa,
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		-- url = "https://github.com/folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"scottmckendry/cyberdream.nvim",
		-- url = "https://github.com/scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"olimorris/onedarkpro.nvim",
		-- url = "https://github.com/olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
	},
}
