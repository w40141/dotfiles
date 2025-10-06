local conf = require("plugins.lang.config")

return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- url = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	-- url = "https://github.com/iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = ":call mkdp#util#install()",
	-- 	config = conf.previm,
	-- },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = conf.previm,
	},
	-- {
	-- 	"OXY2DEV/markview.nvim",
	-- 	-- url = "https://github.com/OXY2DEV/markview.nvim",
	-- 	ft = { "markdown", "html", "tex", "latex", "yaml" },
	-- },
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
