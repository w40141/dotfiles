local conf = require("plugins.cmp.config")
local setup = require("plugins.cmp.setup")

return {
	-- {
	-- 	"delphinus/skkeleton_indicator.nvim",
	-- 	-- url = "https://github.com/delphinus/skkeleton_indicator.nvim",
	-- 	config = function()
	-- 		require("skkeleton_indicator").setup()
	-- 	end,
	-- 	lazy = false,
	-- },
	{
		"vim-denops/denops.vim",
		-- url = "https://github.com/vim-denops/denops.vim",
	},
	{
		"vim-skk/skkeleton",
		-- url = "https://github.com/vim-skk/skkeleton",
		dependencies = {
			"vim-denops/denops.vim",
		},
		init = setup.skkeleton,
		config = conf.skkeleton,
		event = { "VeryLazy" },
	},
	{
		"rinx/cmp-skkeleton",
		-- url = "https://github.com/rinx/cmp-skkeleton",
		dependencies = {
			"vim-skk/skkeleton",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		-- url = "https://github.com/hrsh7th/nvim-cmp",
		config = conf.cmp,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"ray-x/lsp_signature.nvim",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-buffer",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"f3fora/cmp-spell",
			"saadparwaiz1/cmp_luasnip",
			"zbirenbaum/copilot-cmp",
			"chrisgrieser/cmp_yanky",
			"rinx/cmp-skkeleton",
		},
	},
	{
		"onsails/lspkind.nvim",
		-- url = "https://github.com/onsails/lspkind.nvim",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		-- url = "https://github.com/hrsh7th/cmp-nvim-lsp",
	},
	{
		"ray-x/lsp_signature.nvim",
		-- url = "https://github.com/ray-x/lsp_signature.nvim",
		-- event = "VeryLazy",
		config = conf.signature,
	},
	{
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		-- url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
	},
	{
		"hrsh7th/cmp-buffer",
		-- url = "https://github.com/hrsh7th/cmp-buffer",
	},
	{
		"ray-x/cmp-treesitter",
		-- url = "https://github.com/ray-x/cmp-treesitter",
	},
	{
		"hrsh7th/cmp-cmdline",
		-- url = "https://github.com/hrsh7th/cmp-cmdline",
	},
	{
		"hrsh7th/cmp-path",
		-- url = "https://github.com/hrsh7th/cmp-path",
	},
	{
		"f3fora/cmp-spell",
		-- url = "https://github.com/f3fora/cmp-spell",
	},
	{
		"chrisgrieser/cmp_yanky",
		-- url = "https://github.com/chrisgrieser/cmp_yanky",
	},
	{
		"saadparwaiz1/cmp_luasnip",
		-- url = "https://github.com/saadparwaiz1/cmp_luasnip",
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		-- url = "https://github.com/L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		build = "make install_jsregexp",
		config = conf.luasnip,
	},
	{
		"rafamadriz/friendly-snippets",
		-- url = "https://github.com/rafamadriz/friendly-snippets",
	},
	{
		"zbirenbaum/copilot-cmp",
		-- url = "https://github.com/zbirenbaum/copilot-cmp",
		config = conf.copilot_cmp,
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
	},
	{
		"zbirenbaum/copilot.lua",
		-- url = "https://github.com/zbirenbaum/copilot.lua",
		build = ":Copilot auth",
		config = conf.copilot,
	},
	{
		"windwp/nvim-autopairs",
		-- url = "https://github.com/windwp/nvim-autopairs",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = conf.autopairs,
		event = { "InsertEnter" },
	},
}
