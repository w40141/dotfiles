local conf = require("plugins.lang.config")

return {
	{
		"iamcco/markdown-preview.nvim",
		-- url = "https://github.com/iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- build = function()
		-- 	vim.fn["mkdp#util#install"]()
		-- end,
		build = ":call mkdp#util#install()",
		config = conf.previm,
	},
	{
		"OXY2DEV/markview.nvim",
		-- url = "https://github.com/OXY2DEV/markview.nvim",
		ft = { "markdown", "html", "tex", "latex", "yaml" },
		-- config = function()
		-- 	require("mark").setup({})
		-- end,
	},
	{
		"richardbizik/nvim-toc",
		-- url = "https://github.com/richardbizik/nvim-toc"
		ft = { "markdown" },
		opts = {
			toc_header = "Table of Contents",
		},
	},
	{
		"kevinhwang91/nvim-bqf",
		-- url = "https://github.com/kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		-- url = "https://github.com/folke/lazydev.nvim"
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"Bilal2453/luvit-meta",
		-- url = "https://github.com/Bilal2453/luvit-meta",
		ft = "lua",
	},
}
