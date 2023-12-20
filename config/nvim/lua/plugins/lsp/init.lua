local conf = require("plugins.lsp.config")
local setup = require("plugins.lsp.setup")

return {
	{
		"neovim/nvim-lspconfig",
		-- url = "https://github.com/neovim/nvim-lspconfig",
		init = setup.lspconfig,
		config = conf.lspconfig,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- url = "https://github.com/williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
