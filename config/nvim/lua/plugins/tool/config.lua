local M = {}

function M.neogen()
	require("neogen").setup({
		snippet_engine = "luasnip",
		enabled = true,
		input_after_comment = true,
	})
end

function M.colorizer()
	require("colorizer").setup({
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
	})
end

function M.swagger()
	require("swagger-preview").setup({
		port = 8003,
		host = "localhost",
	})
end

return M
