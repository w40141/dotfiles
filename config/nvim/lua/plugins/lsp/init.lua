local conf = require("plugins.lsp.config")
local keys = require("plugins.lsp.keys")

local servers = {
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
}

return {
	{
		"mason-org/mason.nvim",
		-- url = "https://github.com/mason-org/mason.nvim"
		-- cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
		lazy = false,
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "rounded",
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
	-- {
	-- 	"mason-org/mason-lspconfig.nvim",
	-- 	-- url = "https://github.com/mason-org/mason-lspconfig.nvim"
	-- 	opts = {
	-- 		automatic_enable = true,
	-- 	},
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"mason-org/mason.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 	},
	-- },
	{
		"neovim/nvim-lspconfig",
		-- url = "https://github.com/neovim/nvim-lspconfig",
		-- event = { "BufReadPre", "BufNewFile" },
		event = "VeryLazy",
		config = function()
			conf.lspconfig()
			vim.lsp.enable(servers)
		end,
		keys = keys.lspconfig,
	},
}
