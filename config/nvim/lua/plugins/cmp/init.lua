local conf = require("plugins.cmp.config")
local setup = require("plugins.cmp.setup")

return {
	{
		"vim-skk/skkeleton",
		dependencies = {
			"vim-denops/denops.vim",
		},
		init = setup.skkeleton,
		config = conf.skkeleton,
		event = "VeryLazy",
	},
	-- 補完エンジン本体
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = conf.cmp,
		dependencies = {
			"onsails/lspkind.nvim",
		},
	},
	-- Insert mode専用
	{
		"chrisgrieser/cmp_yanky",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"f3fora/cmp-spell",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"ray-x/cmp-treesitter",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"rinx/cmp-skkeleton",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	-- Insert modeとコマンドラインの両方で使う
	{
		"hrsh7th/cmp-buffer",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"hrsh7th/cmp-path",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "hrsh7th/nvim-cmp" },
	},

	-- コマンドライン専用
	{
		"hrsh7th/cmp-cmdline",
		event = "CmdlineEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	{
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		event = "CmdlineEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
	},
	-- Snippet
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		build = "make install_jsregexp",
		config = conf.luasnip,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"saadparwaiz1/cmp_luasnip",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
		},
	},
	-- Copilot補完
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		opts = {},
		dependencies = {
			"hrsh7th/nvim-cmp",
			"zbirenbaum/copilot.lua",
		},
	},
	-- シグネチャ
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			hint_prefix = "󰛨 ",
		},
	},
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
