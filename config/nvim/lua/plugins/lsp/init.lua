local conf = require("plugins.lsp.config")
local keys = require("plugins.lsp.keys")

return {
	{
		"mason-org/mason.nvim",
		-- url = "https://github.com/mason-org/mason.nvim"
		cmd = { "Mason" },
		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				width = 0.7,
				height = 0.7,
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- url = "https://github.com/mason-org/mason-lspconfig.nvim"
		opts = {
			automatic_enable = true,
		},
    event = { "FocusLost", "CursorHold" },
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		-- url = "https://github.com/neovim/nvim-lspconfig",
    event = { "FocusLost", "CursorHold" },
		config = conf.lspconfig,
		keys = keys.lspconfig,
	},
}
