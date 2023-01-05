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
		config = conf.cmp,
		requires = {
			-- https://github.com/onsails/lspkind.nvim
			{ "onsails/lspkind-nvim", module = { "lspkind" } },
			-- https://github.com/hrsh7th/cmp-nvim-lsp
			i({ "hrsh7th/cmp-nvim-lsp", module = { "cmp_nvim_lsp" } }),
			-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
			-- i({ "hrsh7th/cmp-nvim-lsp-signature-help" }),
			-- https://github.com/ray-x/lsp_signature.nvim
			i({ "ray-x/lsp_signature.nvim", config = conf.signature }),
			-- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
			i({ "hrsh7th/cmp-nvim-lsp-document-symbol" }),
			-- https://github.com/hrsh7th/cmp-buffer
			i({ "hrsh7th/cmp-buffer" }),
			-- https://github.com/ray-x/cmp-treesitter
			i({ "ray-x/cmp-treesitter" }),
			-- https://github.com/yutkat/cmp-mocword
			i({ "yutkat/cmp-mocword" }),
			-- https://github.com/hrsh7th/cmp-cmdline
			c({ "hrsh7th/cmp-cmdline" }),
			-- https://github.com/hrsh7th/cmp-path
			c({ "hrsh7th/cmp-path" }),
			-- https://github.com/saadparwaiz1/cmp_luasnip
			i({
				"saadparwaiz1/cmp_luasnip",
				requires = {
					-- https://github.com/L3MON4D3/LuaSnip
					"L3MON4D3/LuaSnip",
					module = { "luasnip" },
					requires = { "rafamadriz/friendly-snippets" },
					config = conf.luasnip,
				},
			}),
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
