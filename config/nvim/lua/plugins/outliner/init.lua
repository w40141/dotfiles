local conf = require("plugins.outliner.config")
local setup = require("plugins.outliner.setup")

return {
	{
		-- Neovim plugin for a code outline window
		"stevearc/aerial.nvim",
		-- url = "https://github.com/stevearc/aerial.nvim",
		cmd = { "Aerial" },
		init = setup.aerial,
		config = conf.aerial,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
