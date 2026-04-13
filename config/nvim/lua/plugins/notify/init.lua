local opts = require("plugins.notify.opts")

return {
	-- {
	-- 	"folke/noice.nvim",
	-- 	-- url = "https://github.com/folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = opts.noice,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },
	{
		"rcarriga/nvim-notify",
		-- url = "https://github.com/rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = opts.notify,
	},
	{
		"j-hui/fidget.nvim",
		-- url = "https://github.com/j-hui/fidget.nvim",
		event = "LspAttach",
		opts = opts.fidget,
	},
}
