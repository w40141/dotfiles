return {
		-- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"CursorHold",
			"FocusLost",
		},
		requires = {
			{
				-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				event = { "FocusLost", "CursorHold" },
				config = require("rc.config.mason-tool-installer"),
			},
			{
				-- https://github.com/williamboman/mason-lspconfig.nvim
				"williamboman/mason-lspconfig.nvim",
				module = { "mason-lspconfig" },
			},
			{
				-- https://github.com/williamboman/mason.nvim
				"williamboman/mason.nvim",
				event = { "FocusLost", "CursorHold" },
				module = { "mason" },
			},
		},
		wants = {
			"mason.nvim",
			"mason-lspconfig.nvim",
			"cmp-nvim-lsp",
		},
		setup = require("rc.setup.nvim-lspconfig"),
		config = require("rc.config.nvim-lspconfig"),
}
