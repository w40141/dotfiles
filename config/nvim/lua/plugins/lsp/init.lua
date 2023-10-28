local conf = require("plugins.lsp.config")
local setup = require("plugins.lsp.setup")

-- TODO: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
	{
		"neovim/nvim-lspconfig",
		init = setup.lspconfig,
		config = conf.lspconfig,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			dependencies = "williamboman/mason.nvim",
		},
	},
}
