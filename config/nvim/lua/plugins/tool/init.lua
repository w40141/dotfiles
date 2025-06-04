local keys = require("plugins.tool.keys")

return {
	{
		"pogyomo/winresize.nvim",
		-- url = "https://github.com/pogyomo/winresize.nvim"
		keys = keys.winresize,
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
		opts = {
			snippet_engine = "luasnip",
			enabled = true,
			input_after_comment = true,
		},
		cmd = { "Neogen" },
		keys = keys.neogen,
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
		opts = {
			{
				"css",
				"javascript",
				"typescript",
			},
			{
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = false, -- CSS rgb() and rgba() functions
				hsl_fn = false, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			},
		},
	},
	{
		"vinnymeller/swagger-preview.nvim",
		-- url = "https://github.com/vinnymeller/swagger-preview.nvim",
		opts = {
			port = 8003,
			host = "localhost",
		},
		build = "npm install -g swagger-ui-watcher",
		cmd = {
			"SwaggerPreview",
			"SwaggerPreviewStop",
			"SwaggerPreviewToggle",
		},
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			default = {
				embed_image_as_base64 = false,
				prompt_for_file_name = false,
				drag_and_drop = {
					insert_mode = true,
				},
				use_absolute_path = true,
			},
		},
	},
}
