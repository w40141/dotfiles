local opts = require("plugins.format.opts")
local setup = require("plugins.format.setup")
local keys = require("plugins.format.keys")

return {
	{
		"stevearc/conform.nvim",
		-- url = "https://github.com/stevearc/conform.nvim",
		event = { "FocusLost", "CursorHold" },
		cmd = { "ConformInfo" },
		init = setup.conform,
		keys = keys.conform,
		opts = opts.conform,
		dependencies = {
			{
				"zapling/mason-conform.nvim",
				opts = {},
				-- url = "https://github.com/zapling/mason-conform.nvim"
			},
		},
	},
}
