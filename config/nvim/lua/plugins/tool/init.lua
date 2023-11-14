local conf = require("plugins.tool.config")
local setup = require("plugins.tool.setup")

return {
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
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
		-- TODO: setting
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<c-;>", mode = "n" },
		},
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = conf.toggleterm,
	},
	{
		-- Resizing of windows
		"simeji/winresizer",
		keys = {
			{ "<C-e>", mode = "n" },
		},
		init = setup.winresizer,
	},
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		keys = {
			{ "<Plug>(quickhl-manual-this)", mode = "n" },
			{ "<Plug>(quickhl-manual-reset)", mode = "n" },
		},
		init = setup.quickhl,
	},
	{
		-- Highlight length of search result
		-- TODO: luaで書かれたものを探す
		"kevinhwang91/nvim-hlslens",
		keys = {
			{ "*", mode = "n" },
			{ "g*", mode = "n" },
			{ "g*", mode = "n" },
		},
		event = { "CmdlineEnter" },
		dependencies = { "rapan931/lasterisk.nvim" },
		init = setup.hlslens,
		config = conf.hlslens,
	},
}
