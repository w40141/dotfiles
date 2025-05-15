local keys = require("plugins.terminal.keys")

return {
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		-- url = "https://github.com/akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		-- config = conf.toggleterm,
		opts = {
			shade_terminals = false,
			shading_factor = "1",
			start_in_insert = false,
			insert_mappings = true,
			direction = "float",
			persist_size = false,
			close_on_exit = true,
			shell = "fish",
			float_opts = {
				border = "double",
				width = 150,
				height = 40,
				winblend = 2,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
		keys = keys.toggleterm,
	},
}
