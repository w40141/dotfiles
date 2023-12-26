local conf = require("plugins.tool.config")
local setup = require("plugins.tool.setup")

-- TODO: https://zenn.dev/koga1020/articles/009766e1bec42c
-- TODO: https://github.com/glidenote/memolist.vim
-- TODO: https://github.com/delphinus/telescope-memo.nvim
return {
	{
		"glidenote/memolist.vim",
		-- url = "https://github.com/glidenote/memolist.vim"
		cmd = {
			"MemoList",
			"MemoNew",
			"MemoGrep",
		},
		config = conf.memolist,
		init = setup.memolist,
	},
	{
		"dstein64/vim-startuptime",
		-- url = "https://github.com/dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		-- Generating images of source code using
		"segeljakt/vim-silicon",
		-- url = "https://github.com/segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		-- Open URI
		"tyru/open-browser.vim",
		-- url = "https://github.com/tyru/open-browser.vim",
		keys = {
			{ "<plug>(openbrowser-smart-search)", mode = "n" },
		},
		init = setup.open_browser,
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
