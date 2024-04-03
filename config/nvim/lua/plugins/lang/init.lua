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
}
