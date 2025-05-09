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
		build = ':call mkdp#util#install()',
		config = conf.previm,
	},
	{
		-- TODO: 設定
		"kevinhwang91/nvim-bqf",
		-- url = "https://github.com/kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"folke/lazydev.nvim",
		-- url = "https://github.com/folke/lazydev.nvim"
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	-- {
	-- 	"folke/neodev.nvim",
	-- 	-- url = "https://github.com/folke/neodev.nvim",
	-- 	opts = {},
	-- 	ft = { "lua" },
	-- },
	{
		"richardbizik/nvim-toc",
		-- url = "https://github.com/richardbizik/nvim-toc"
		ft = { "markdown" },
		config = conf.toc,
	},
	{
		"windwp/nvim-ts-autotag",
		-- url = "https://github.com/windwp/nvim-ts-autotag"
		-- event = "VeryLazy",
    event = { "InsertEnter" },
		config = conf.autotag,
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		-- url = "https://github.com/MeanderingProgrammer/markdown.nvim"
		-- dependencies = {
		-- 	"nvim-treesitter/nvim-treesitter",
		-- 	"nvim-tree/nvim-web-devicons",
		-- },
		ft = { "markdown" },
		config = conf.markdown,
	},
	-- {
	-- 	-- TODO: watch
	-- 	"OXY2DEV/markview.nvim",
	-- 	-- url = "https://github.com/OXY2DEV/markview.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	ft = { "markdown" },
	-- 	-- config = function()
	-- 	-- 	require("mark").setup({})
	-- 	-- end,
	-- },
}
