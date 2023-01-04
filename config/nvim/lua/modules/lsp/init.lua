local conf = require("modules.lsp.config")
-- local setup = require("modules.lsp.setup")

local function e(p)
	p.event = { "BufReadPre", "FocusLost", "CursorHold" }
	return p
end

return e({
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	requires = {
		e({
			-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = conf.mason_tool_installer,
		}),
		{
			-- https://github.com/williamboman/mason-lspconfig.nvim
			"williamboman/mason-lspconfig.nvim",
			module = { "mason-lspconfig" },
		},
		{
			-- https://github.com/williamboman/mason.nvim
			"williamboman/mason.nvim",
			module = { "mason" },
		},
	},
	wants = {
		"mason.nvim",
		"mason-lspconfig.nvim",
		"cmp-nvim-lsp",
	},
	-- setup = setup.lspconfig,
	config = conf.lspconfig,
})
