return {
	{
		"vim-jp/vimdoc-ja",
		cmd = "help",
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		"vim-test/vim-test",
		event = "CmdlineEnter",
		setup = require("rc.setup.vim-test"),
		config = require("rc.config.vim-test"),
	},
	{
		-- Generating images of source code using
		-- https://github.com/segeljakt/vim-silicon
		"segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		-- Open URI
		-- https://github.com/tyru/open-browser.vim
		"tyru/open-browser.vim",
		keys = { "<plug>(openbrowser-smart-search)" },
		setup = require("rc.setup.open-browser"),
	},
}
