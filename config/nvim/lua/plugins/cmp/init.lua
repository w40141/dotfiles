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
	-- {
	-- 	"vim-denops/denops.vim",
	-- 	-- url = "https://github.com/vim-denops/denops.vim",
	-- },
	{
		"vim-skk/skkeleton",
		-- url = "https://github.com/vim-skk/skkeleton",
		dependencies = {
			"vim-denops/denops.vim",
		},
		init = setup.skkeleton,
		config = conf.skkeleton,
		-- event = { "InsertEnter", "CmdlineEnter" },
		event = {"VeryLazy"}
	},
	{
		-- "yioneko/nvim-cmp",
		-- branch = "perf",
		"hrsh7th/nvim-cmp",
		-- url = "https://github.com/hrsh7th/nvim-cmp",
		config = conf.cmp,
		-- event = { "InsertEnter", "CmdlineEnter" },
		-- dependencies = {
		-- 	"chrisgrieser/cmp_yanky",
		-- 	"f3fora/cmp-spell",
		-- 	"hrsh7th/cmp-buffer",
		-- 	"hrsh7th/cmp-cmdline",
		-- 	"hrsh7th/cmp-nvim-lsp",
		-- 	"hrsh7th/cmp-nvim-lsp-document-symbol",
		-- 	"hrsh7th/cmp-path",
		-- 	"onsails/lspkind.nvim",
		-- 	"ray-x/cmp-treesitter",
		-- 	"ray-x/lsp_signature.nvim",
		-- 	"rinx/cmp-skkeleton",
		-- 	"saadparwaiz1/cmp_luasnip",
		-- 	"zbirenbaum/copilot-cmp",
		-- },
	},
	{
		"chrisgrieser/cmp_yanky",
		-- url = "https://github.com/chrisgrieser/cmp_yanky",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"f3fora/cmp-spell",
		-- url = "https://github.com/f3fora/cmp-spell",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"hrsh7th/cmp-buffer",
		-- url = "https://github.com/hrsh7th/cmp-buffer",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"hrsh7th/cmp-cmdline",
		-- url = "https://github.com/hrsh7th/cmp-cmdline",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		-- url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		-- url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"hrsh7th/cmp-path",
		-- url = "https://github.com/hrsh7th/cmp-path",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"onsails/lspkind.nvim",
		-- url = "https://github.com/onsails/lspkind.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"ray-x/cmp-treesitter",
		-- url = "https://github.com/ray-x/cmp-treesitter",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	{
		"ray-x/lsp_signature.nvim",
		-- url = "https://github.com/ray-x/lsp_signature.nvim",
		-- event = "VeryLazy",
		event = { "InsertEnter", "CmdlineEnter" },
		config = conf.signature,
	},
	{
		"rinx/cmp-skkeleton",
		event = { "InsertEnter", "CmdlineEnter" },
		-- url = "https://github.com/rinx/cmp-skkeleton",
	},
	{
		"saadparwaiz1/cmp_luasnip",
		event = { "InsertEnter", "CmdlineEnter" },
		-- url = "https://github.com/saadparwaiz1/cmp_luasnip",
	},
	{
		"L3MON4D3/LuaSnip",
		event = { "InsertEnter", "CmdlineEnter" },
		-- url = "https://github.com/L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = conf.luasnip,
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"rafamadriz/friendly-snippets",
		event = { "InsertEnter", "CmdlineEnter" },
		-- url = "https://github.com/rafamadriz/friendly-snippets",
	},
	{
		"zbirenbaum/copilot-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
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
		config = conf.autopairs,
		event = { "InsertEnter" },
	},
}
