-- local conf = require("plugins.lang.config")

return {
	{
		-- TODO: 設定
		url = "https://github.com/iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		-- TODO: 設定
		url = "https://github.com/kevinhwang91/nvim-bqf",
		ft = "qf",
	},
}
