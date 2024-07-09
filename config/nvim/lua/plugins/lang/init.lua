local conf = require("plugins.lang.config")

return {
	{
		"iamcco/markdown-preview.nvim",
		-- url = "https://github.com/iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = conf.previm,
	},
	{
		-- TODO: 設定
		"kevinhwang91/nvim-bqf",
		-- url = "https://github.com/kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"folke/neodev.nvim",
		-- url = "https://github.com/folke/neodev.nvim",
		opts = {},
		ft = { "lua" },
	},
	{
		"richardbizik/nvim-toc",
		-- url = "https://github.com/richardbizik/nvim-toc"
		ft = { "markdown" },
		config = conf.toc,
	},
	{
		"windwp/nvim-ts-autotag",
		-- url = "https://github.com/windwp/nvim-ts-autotag"
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- {
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	-- url = "https://github.com/MeanderingProgrammer/markdown.nvim"
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	ft = { "markdown" },
	-- 	config = function()
	-- 		require("render-markdown").setup({
	-- 			latex_enabled = false,
	-- 		})
	-- 	end,
	-- },
	{
		-- TODO: watch
		"OXY2DEV/markview.nvim",
		-- url = "https://github.com/OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		ft = { "markdown" },
		-- config = function()
		-- 	require("mark").setup({})
		-- end,
	},
	-- {
	-- 	"lukas-reineke/headlines.nvim",
	-- 	-- url = "https://github.com/lukas-reineke/headlines.nvim"
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	config = function()
	-- 		require("headlines").setup({})
	-- 	end,
	-- },
}
