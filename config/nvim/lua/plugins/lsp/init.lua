local conf = require("plugins.lsp.config")
local keys = require("plugins.lsp.keys")

return {
	{
		"williamboman/mason.nvim",
		-- url = "https://github.com/williamboman/mason.nvim",
		cmd = { "Mason" },
		config = conf.mason,
		build = ":MasonUpdate",
	},
	{
		"neovim/nvim-lspconfig",
		-- url = "https://github.com/neovim/nvim-lspconfig",
		-- init = setup.lspconfig,
		config = conf.lspconfig,
		event = { "FocusLost", "CursorHold" },
    keys = keys.lspconfig,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- url = "https://github.com/williamboman/mason-lspconfig.nvim",
		event = { "FocusLost", "CursorHold" },
	},
}
