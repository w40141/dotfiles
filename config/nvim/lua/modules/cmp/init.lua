local conf = require("modules.cmp.config")

local function i(p)
	p.event = { "InsertEnter" }
	return p
end

local function c(p)
	p.event = { "CmdlineEnter" }
	return p
end

return {
	{
		-- https://github.com/hrsh7th/nvim-cmp
		"hrsh7th/nvim-cmp",
		module = { "cmp" },
		-- config = require("rc.config.nvim-cmp"),
		config = conf.cmp,
		requires = {
			-- https://github.com/onsails/lspkind.nvim
			{ "onsails/lspkind-nvim", module = { "lspkind" } },
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp
				"hrsh7th/cmp-nvim-lsp",
				module = { "cmp_nvim_lsp" },
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
				"hrsh7th/cmp-nvim-lsp-signature-help",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-buffer
				"hrsh7th/cmp-buffer",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/ray-x/cmp-treesitter
				"ray-x/cmp-treesitter",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/yutkat/cmp-mocword
				"yutkat/cmp-mocword",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-cmdline
				"hrsh7th/cmp-cmdline",
				event = { "CmdlineEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-path
				"hrsh7th/cmp-path",
				event = { "CmdlineEnter" },
			},
			{
				-- https://github.com/saadparwaiz1/cmp_luasnip
				"saadparwaiz1/cmp_luasnip",
				event = { "InsertEnter" },
				requires = {
					-- https://github.com/L3MON4D3/LuaSnip
					"L3MON4D3/LuaSnip",
					module = { "luasnip" },
					requires = { "rafamadriz/friendly-snippets" },
					config = conf.luasnip,
				},
			},
		},
	},
	{
		-- https://github.com/windwp/nvim-autopairs
		"windwp/nvim-autopairs",
		module = { "nvim-autopairs" },
		requires = { "hrsh7th/nvim-cmp" },
		want = { "nvim-cmp" },
		config = conf.autopairs,
	},
}
