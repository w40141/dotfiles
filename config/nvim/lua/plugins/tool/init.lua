local conf = require("plugins.tool.config")
local setup = require("plugins.tool.setup")

return {
	{
		"NeogitOrg/neogit",
		-- url = "https://github.com/NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- url = "https://github.com/nvim-lua/plenary.nvim",
		},
		cmd = { "Neogit" },
		config = conf.neogit,
	},
	{
		-- Delete buffers
		"famiu/bufdelete.nvim",
		-- url = "https://github.com/famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		event = "CmdlineEnter",
	},
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		-- url = "https://github.com/akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		config = conf.toggleterm,
		init = setup.toggleterm,
	},
	{
		-- Resizing of windows
		"simeji/winresizer",
		-- url = "https://github.com/simeji/winresizer",
		keys = {
			{ "<C-e>", mode = "n" },
		},
		init = setup.winresizer,
	},
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		-- url = "https://github.com/t9md/vim-quickhl",
		keys = {
			{ "<Plug>(quickhl-manual-this)", mode = "n" },
			{ "<Plug>(quickhl-manual-reset)", mode = "n" },
		},
		init = setup.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		-- url = "https://github.com/kevinhwang91/nvim-hlslens",
		keys = {
			{ "*", mode = "n" },
			{ "g*", mode = "n" },
			{ "g*", mode = "n" },
		},
		event = { "CmdlineEnter" },
		dependencies = {
			"rapan931/lasterisk.nvim",
		},
		init = setup.hlslens,
		config = conf.hlslens,
	},
}
