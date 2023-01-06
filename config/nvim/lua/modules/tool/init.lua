local conf = require("modules.tool.config")
local setup = require("modules.tool.setup")

return {
	{
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		wants = "plenary.nvim",
		cmd = { "Neogit" },
		config = conf.neogit,
	},
	{
		-- Delete buffers
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		event = "CmdlineEnter",
	},
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		keys = { "n", [[<c-;>]] },
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = conf.toggleterm,
	},
	{
		-- Resizing of windows
		"simeji/winresizer",
		keys = { { "n", "<C-e>" } },
		setup = setup.winresizer,
	},
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		keys = {
			{ "n", "<Plug>(quickhl-manual-this)" },
			{ "n", "<Plug>(quickhl-manual-reset)" },
		},
		setup = setup.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		keys = { { "n", "*" }, { "n", "g*" }, { "n", "g*" } },
		event = { "CmdlineEnter" },
		module = { "hlslens" },
		requires = {
			"rapan931/lasterisk.nvim",
			module = { "lasterisk" },
		},
		wants = { "lasterisk.nvim" },
		setup = setup.hlslens,
		config = conf.hlslens,
	},
	-- TODO: https://github.com/phaazon/hop.nvim
	-- {
	-- 	"phaazon/hop.nvim",
	-- 	keys = {
	-- 		{ "n", [['j]] },
	-- 		{ "v", [['j]] },
	-- 		{ "n", [['k]] },
	-- 		{ "v", [['k]] },
	-- 	},
	-- 	config = conf.hop,
	-- },
}
