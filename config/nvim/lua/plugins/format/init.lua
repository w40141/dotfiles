local conf = require("plugins.format.config")
local setup = require("plugins.format.setup")

return {
	{
		"stevearc/conform.nvim",
		-- url = "https://github.com/stevearc/conform.nvim",
		event = { "FocusLost", "CursorHold" },
		cmd = { "ConformInfo" },
		config = conf.conform,
		init = setup.conform,
	},
	{
		"zapling/mason-conform.nvim",
		-- url = "https://github.com/zapling/mason-conform.nvim"
	},
}
