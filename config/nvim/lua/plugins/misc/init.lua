-- local conf = require("plugins.misc.config")
local setup = require("plugins.misc.setup")

return {
	{
		url = "https://github.com/dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	-- {
	-- 	url = "https://github.com/vim-test/vim-test",
	-- 	event = "CmdlineEnter",
	-- 	init = setup.vim_test,
	-- 	config = conf.vim_test,
	-- },
	{
		-- Generating images of source code using
		url = "https://github.com/segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		-- Open URI
		url = "https://github.com/tyru/open-browser.vim",
		keys = {
			{ "<plug>(openbrowser-smart-search)", mode = "n" },
		},
		init = setup.open_browser,
	},
}
