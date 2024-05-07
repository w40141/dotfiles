local conf = require("plugins.linter.config")

return {
	{
		"mfussenegger/nvim-lint",
		-- url = "https://github.com/mfussenegger/nvim-lint",
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		config = conf.lint,
		dependencies = {
			"rshkarin/mason-nvim-lint",
		},
	},
	{
		"rshkarin/mason-nvim-lint",
		-- url = "https://github.com/rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
