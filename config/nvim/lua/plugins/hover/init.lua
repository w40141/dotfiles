local setup = require("plugins.hover.setup")
local conf = require("plugins.hover.config")

return {
	{
		"lewis6991/hover.nvim",
		-- url = "https://github.com/lewis6991/hover.nvim",
		-- event = { "BufReadPre", "FocusLost", "CursorHold" },
		event = { "FocusLost", "CursorHold" },
		init = setup.hover,
		config = conf.hover,
	},
}
