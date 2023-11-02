local conf = require("plugins.misc.config")
local setup = require("plugins.misc.setup")

return {
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		"vim-test/vim-test",
		event = "CmdlineEnter",
		init = setup.vim_test,
		config = conf.vim_test,
	},
	{
		-- Generating images of source code using
		"segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		-- Open URI
		"tyru/open-browser.vim",
		keys = {
			{ "<plug>(openbrowser-smart-search)", mode = "n" },
		},
		init = setup.open_browser,
	},
}
