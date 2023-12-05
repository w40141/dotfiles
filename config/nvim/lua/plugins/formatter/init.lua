local conf = require("plugins.formatter.config")
local setup = require("plugins.formatter.setup")

-- TODO: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
return {
	{
		"stevearc/conform.nvim",
		-- url = "https://github.com/stevearc/conform.nvim",
		event = { "BufReadPre", "FocusLost", "CursorHold" },
		cmd = { "ConformInfo" },
		config = conf.conform,
		init = setup.conform,
	},
}
