local conf = require("plugins.lsp.config")
local keys = require("plugins.lsp.keys")

return {
	{
		"mason-org/mason.nvim",
		-- url = "https://github.com/mason-org/mason.nvim"
		cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
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
			ensure_installed = {
				"bashls",
				"biome",
				"docker_compose_language_service",
				"docker_language_server",
				"elixirls",
				"elp",
				"fish_lsp",
				"gopls",
				"html",
				"lua_ls",
				"marksman",
				"sqls",
				"taplo",
				"terraformls",
				"vtsls",
				"yamlls",
			},
		},
    event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		-- url = "https://github.com/neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
		config = conf.lspconfig,
		keys = keys.lspconfig,
	},
}
