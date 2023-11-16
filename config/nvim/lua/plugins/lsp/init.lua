local conf = require("plugins.lsp.config")
local setup = require("plugins.lsp.setup")

-- TODO: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
	{
		url = "https://github.com/neovim/nvim-lspconfig",
		init = setup.lspconfig,
		config = conf.lspconfig,
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		dependencies = {
			{
				url = "https://github.com/williamboman/mason-lspconfig.nvim",
				dependencies = {
					url = "https://github.com/williamboman/mason.nvim",
				},
			},
		},
	},
}
