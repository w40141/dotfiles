local conf = require("plugins.color.config")

return {
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		config = conf.kanagawa,
		opts = {
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		},
		-- lazy = false,
		event = "VimEnter",
	},
}
