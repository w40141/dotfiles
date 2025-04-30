local conf = require("plugins.color.config")
-- local setup = require("plugins.color.setup")

return {
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		config = conf.kanagawa,
		-- lazy = false,
		event = "VimEnter",
	},
	{
		"folke/tokyonight.nvim",
		-- url = "https://github.com/folke/tokyonight.nvim",
		-- lazy = false,
		opts = {},
		event = "VimEnter",
		-- event = "VeryLazy",
	},
	{
		"scottmckendry/cyberdream.nvim",
		-- url = "https://github.com/scottmckendry/cyberdream.nvim",
		-- lazy = false,
		event = "VimEnter",
		-- event = "VeryLazy",
	},
	{
		"olimorris/onedarkpro.nvim",
		-- url = "https://github.com/olimorris/onedarkpro.nvim",
		-- lazy = false,
		event = "VimEnter",
		-- event = "VeryLazy",
	},
}
