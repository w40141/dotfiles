local conf = require("plugins.terminal.config")
local setup = require("plugins.terminal.setup")

return {
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		-- url = "https://github.com/akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		config = conf.toggleterm,
		init = setup.toggleterm,
	},
}
