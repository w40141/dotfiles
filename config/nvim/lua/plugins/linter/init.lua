local conf = require("plugins.linter.config")

-- TODO: https://github.com/mfussenegger/nvim-lint
return {
	{
		url = "https://github.com/mfussenegger/nvim-lint",
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		config = conf.nvim_lint,
		dependencies = {
			{
				url = "https://github.com/rshkarin/mason-nvim-lint",
				dependencies = {
					url = "https://github.com/williamboman/mason.nvim",
				},
			},
		},
	},
}
