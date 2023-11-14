local conf = require("plugins.complement.config")
-- local setup = require("modules.complement.setup")

return {
	{
		"hrsh7th/nvim-cmp",
		config = conf.cmp,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{ "onsails/lspkind-nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"ray-x/lsp_signature.nvim",
				event = "VeryLazy",
				config = conf.lsp_signature,
			},
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "hrsh7th/cmp-buffer" },
			{ "ray-x/cmp-treesitter" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
			{ "f3fora/cmp-spell" },
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					"L3MON4D3/LuaSnip",
					dependencies = { "rafamadriz/friendly-snippets" },
					config = conf.luasnip,
				},
			},
			{
				"zbirenbaum/copilot.lua",
				build = ":Copilot auth",
				config = conf.copilot,
			},
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = conf.autopairs,
	},
}
