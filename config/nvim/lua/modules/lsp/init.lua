local conf = require("modules.lsp.config")
local setup = require("modules.lsp.setup")

local function e(p)
	p.event = { "BufReadPre", "FocusLost", "CursorHold" }
	return p
end

return {
	e({
		"neovim/nvim-lspconfig",
		requires = {
			{
				"williamboman/mason-lspconfig.nvim",
				module = { "mason-lspconfig" },
			},
			{
				"williamboman/mason.nvim",
				module = { "mason" },
				config = conf.mason,
			},
		},
		wants = {
			"mason.nvim",
			"mason-lspconfig.nvim",
			"cmp-nvim-lsp",
		},
		setup = setup.lspconfig,
		config = conf.lspconfig,
	}),
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
		config = conf.mason_tool_installer,
	},
	-- TODO: https://github.com/kkharji/lspsaga.nvim
	-- TODO: https://zenn.dev/botamotch/articles/c02c51cff7d61d
	-- e({
	-- 	"kkharji/lspsaga.nvim",
	-- 	setup = setup.lspsaga,
	-- 	config = conf.lspsaga,
	-- }),
}
