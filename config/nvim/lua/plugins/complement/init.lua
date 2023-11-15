local conf = require("plugins.complement.config")
-- local setup = require("modules.complement.setup")

return {
	{
		url = "https://github.com/hrsh7th/nvim-cmp",
		config = conf.cmp,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{
				url = "https://github.com/onsails/lspkind.nvim",
			},
			{
				url = "https://github.com/hrsh7th/cmp-nvim-lsp",
			},
			{
				url = "https://github.com/ray-x/lsp_signature.nvim",
				event = "VeryLazy",
				config = conf.signature,
			},
			{
				url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
			},
			{
				url = "https://github.com/hrsh7th/cmp-buffer",
			},
			{
				url = "https://github.com/ray-x/cmp-treesitter",
			},
			{
				url = "https://github.com/hrsh7th/cmp-cmdline",
			},
			{
				url = "https://github.com/hrsh7th/cmp-path",
			},
			{
				url = "https://github.com/f3fora/cmp-spell",
			},
			{
				url = "https://github.com/saadparwaiz1/cmp_luasnip",
				dependencies = {
					url = "https://github.com/L3MON4D3/LuaSnip",
					dependencies = {
						url = "https://github.com/rafamadriz/friendly-snippets",
					},
					config = conf.luasnip,
				},
			},
			{
				url = "https://github.com/zbirenbaum/copilot.lua",
				build = ":Copilot auth",
				config = conf.copilot,
			},
			{
				url = "https://github.com/zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},
	{
		url = "https://github.com/windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = conf.autopairs,
	},
}
