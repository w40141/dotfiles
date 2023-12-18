local conf = require("plugins.format.config")
local setup = require("plugins.format.setup")

return {
	{
		"stevearc/conform.nvim",
		-- url = "https://github.com/stevearc/conform.nvim",
		event = { "BufReadPre" },
		cmd = { "ConformInfo" },
		config = conf.conform,
		init = setup.conform,
	},
}
