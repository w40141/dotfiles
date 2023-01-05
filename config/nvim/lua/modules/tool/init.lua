local conf = require("modules.tool.config")
local setup = require("modules.tool.setup")

return {
	{
		-- https://github.com/TimUntersberger/neogit
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		wants = "plenary.nvim",
		cmd = { "Neogit" },
		config = conf.neogit,
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
	{
		-- quickly highlight <cword> or visually selected word
		-- https://github.com/t9md/vim-quickhl
		"t9md/vim-quickhl",
		keys = {
			{ "n", "<Plug>(quickhl-manual-this)" },
			{ "n", "<Plug>(quickhl-manual-reset)" },
		},
		setup = setup.quickhl,
	},
	{
		-- Highlight length of search result
		-- https://github.com/kevinhwang91/nvim-hlslens
		"kevinhwang91/nvim-hlslens",
		keys = { { "n", "*" }, { "n", "g*" }, { "n", "g*" } },
		event = { "CmdlineEnter" },
		module = { "hlslens" },
		requires = {
			-- https://github.com/rapan931/lasterisk.nvim
			"rapan931/lasterisk.nvim",
			module = { "lasterisk" },
		},
		wants = { "lasterisk.nvim" },
		setup = setup.hlslens,
		config = conf.hlslens,
	},
}
