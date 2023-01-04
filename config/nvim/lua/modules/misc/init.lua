local conf = require("modules.misc.config")
local setup = require("modules.misc.setup")

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
		setup = setup.vim_test,
		config = conf.vim_test,
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
		setup = setup.open_browser,
	},
}
