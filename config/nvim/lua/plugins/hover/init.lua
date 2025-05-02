local conf = require("plugins.hover.config")
local keys = require("plugins.hover.keys")

return {
	{
		"lewis6991/hover.nvim",
		-- url = "https://github.com/lewis6991/hover.nvim",
		config = conf.hover,
    keys = keys.hover,
	},
}
