local conf = require("modules.tool.config")
local setup = require("modules.tool.setup")

return {
	{
		-- https://github.com/TimUntersberger/neogit
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		wants = "plenary.nvim",
		cmd = { "Neogit" },
		config = conf.neogit
	},
	{
		-- Delete buffers
		-- https://github.com/famiu/bufdelete.nvim
		"famiu/bufdelete.nvim",
		event = "CmdlineEnter",
	},
	{
		-- Terminal
		-- https://github.com/akinsho/toggleterm.nvim
		"akinsho/toggleterm.nvim",
		keys = { "n", [[<c-;>]] },
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = conf.toggleterm,
	},
	{
		-- Resizing of windows
		-- https://github.com/simeji/winresizer
		"simeji/winresizer",
		keys = { { "n", "<C-e>" } },
		setup = setup.winresizer,
	},
}
