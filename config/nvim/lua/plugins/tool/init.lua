local conf = require("plugins.tool.config")
local setup = require("plugins.tool.setup")

return {
	{
		-- Resizing of windows
		"simeji/winresizer",
		-- url = "https://github.com/simeji/winresizer",
		keys = {
			{ "<C-e>", mode = "n" },
		},
		init = setup.winresizer,
	},
	{
		-- Generating images of source code using
		"segeljakt/vim-silicon",
		-- url = "https://github.com/segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		"dstein64/vim-startuptime",
		-- url = "https://github.com/dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		-- A better annotation generator.
		-- Supports multiple languages and annotation conventions.
		"danymat/neogen",
		-- url = "https://github.com/danymat/neogen",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		init = setup.neogen,
		config = conf.neogen,
		cmd = { "Neogen" },
		keys = {
			{ "<C-l>", mode = "i" },
			{ "<C-h>", mode = "i" },
			{ ",n", mode = "n" },
		},
	},
	{
		"folke/zen-mode.nvim",
		-- url = "https://github.com/folke/zen-mode.nvim",
		cmd = { "ZenMode" },
	},
	{
		-- Colorizer
		"norcalli/nvim-colorizer.lua",
		-- url = "https://github.com/norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = conf.colorizer,
	},
	{
		"vinnymeller/swagger-preview.nvim",
		-- url = "https://github.com/vinnymeller/swagger-preview.nvim",
		config = conf.swagger,
		build = "npm install -g swagger-ui-watcher",
		cmd = {
			"SwaggerPreview",
			"SwaggerPreviewStop",
			"SwaggerPreviewToggle",
		},
	},
}
