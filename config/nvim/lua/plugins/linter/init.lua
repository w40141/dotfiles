local conf = require("plugins.linter.config")

-- TODO: https://github.com/mfussenegger/nvim-lint
return {
	{
		"mfussenegger/nvim-lint",
		event = "VimEnter",
		config = conf.nvim_lint,
		dependencies = {
			"rshkarin/mason-nvim-lint",
			dependencies = "williamboman/mason.nvim",
		},
	},
}
