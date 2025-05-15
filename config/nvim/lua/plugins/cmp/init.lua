local conf = require("plugins.cmp.config")
local setup = require("plugins.cmp.setup")

local function i(s)
	s.event = { "InsertEnter", "CmdlineEnter" }
	return s
end

return {
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
	({
		"hrsh7th/nvim-cmp",
		-- url = "https://github.com/hrsh7th/nvim-cmp",
		config = conf.cmp,
	}),
	-- url = "https://github.com/chrisgrieser/cmp_yanky",
	i({ "chrisgrieser/cmp_yanky" }),
	-- url = "https://github.com/f3fora/cmp-spell",
	i({ "f3fora/cmp-spell" }),
	-- url = "https://github.com/hrsh7th/cmp-buffer",
	i({ "hrsh7th/cmp-buffer" }),
	-- url = "https://github.com/hrsh7th/cmp-cmdline",
	i({ "hrsh7th/cmp-cmdline" }),
	-- url = "https://github.com/hrsh7th/cmp-nvim-lsp",
	i({ "hrsh7th/cmp-nvim-lsp" }),
	-- url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
	i({ "hrsh7th/cmp-nvim-lsp-document-symbol" }),
	-- url = "https://github.com/hrsh7th/cmp-path",
	i({ "hrsh7th/cmp-path" }),
	-- url = "https://github.com/onsails/lspkind.nvim",
	i({ "onsails/lspkind.nvim" }),
	-- url = "https://github.com/ray-x/cmp-treesitter",
	i({ "ray-x/cmp-treesitter" }),
	-- url = "https://github.com/rinx/cmp-skkeleton",
	i({ "rinx/cmp-skkeleton" }),
	-- url = "https://github.com/saadparwaiz1/cmp_luasnip",
	i({ "saadparwaiz1/cmp_luasnip" }),
	-- url = "https://github.com/rafamadriz/friendly-snippets",
	i({ "rafamadriz/friendly-snippets" }),
	i({
		"ray-x/lsp_signature.nvim",
		-- url = "https://github.com/ray-x/lsp_signature.nvim",
		config = conf.signature,
	}),
	i({
		"L3MON4D3/LuaSnip",
		-- url = "https://github.com/L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = conf.luasnip,
		dependencies = { "rafamadriz/friendly-snippets" },
	}),
	i({
		"zbirenbaum/copilot-cmp",
		-- url = "https://github.com/zbirenbaum/copilot-cmp",
		config = conf.copilot_cmp,
		dependencies = {
			"zbirenbaum/copilot.lua",
		},
	}),
	i({
		"windwp/nvim-autopairs",
		-- url = "https://github.com/windwp/nvim-autopairs",
		config = conf.autopairs,
	}),
}
