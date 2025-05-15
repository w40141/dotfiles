local conf = require("plugins.notify.config")
-- local opts = require("plugins.notify.opts")
-- local setup = require("plugins.notiry.setup")

return {
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		{ "rcarriga/nvim-notify", config = conf.notify },
	-- 	},
	-- 	init = setup.noice,
	-- 	config = conf.noice,
	-- },
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	-- url = "https://github.com/stevearc/dressing.nvim",
	-- 	opts = {},
	-- 	config = conf.dressing,
	-- },
	{
		"j-hui/fidget.nvim",
		-- url = "https://github.com/j-hui/fidget.nvim",
		config = conf.fidget,
		-- opts = opts.fidget,
		event = { "VeryLazy" },
	},
}
