local conf = require("plugins.colorscheme.config")

return {
	{
		"rebelot/kanagawa.nvim",
		-- url = "https://github.com/rebelot/kanagawa.nvim",
		event = { "VimEnter" },
		config = conf.kanagawa,
	},
}
