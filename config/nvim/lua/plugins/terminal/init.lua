local conf = require("plugins.terminal.config")
local keys = require("plugins.terminal.keys")

return {
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		-- url = "https://github.com/akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		config = conf.toggleterm,
    keys = keys.toggleterm,
	},
}
