local conf = require("plugins.lsp.config")
local setup = require("plugins.lsp.setup")

return {
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		init = setup.lspconfig,
		config = conf.lspconfig,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
	},
	{
		"williamboman/mason.nvim",
		cmd = { "Mason" },
		config = conf.mason,
	},
	{
		"mfussenegger/nvim-lint",
		event = "VimEnter",
		config = conf.nvim_lint,
		dependencies = "rshkarin/mason-nvim-lint",
	},
	{
		-- TODO: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		config = conf.conform,
		init = setup.conform,
	},
}
