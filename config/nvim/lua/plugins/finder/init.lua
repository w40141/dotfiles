local conf = require("plugins.finder.config")
local opts = require("plugins.finder.opts")
local keys = require("plugins.finder.keys")

return {
	{
		-- Fzf finder
		"nvim-telescope/telescope.nvim",
		-- url = "https://github.com/nvim-telescope/telescope.nvim",
		cmd = {
			"Telescope",
		},
		keys = keys.telescope,
		config = conf.telescope,
	},
	{
		"folke/trouble.nvim",
		-- url = "https://github.com/folke/trouble.nvim",
		cmd = { "Trouble" },
		-- config = conf.trouble,
    opts = opts.trouble,
		keys = keys.trouble,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"delphinus/telescope-memo.nvim",
	},
	{
		-- Highlight, list and search todo comments
		"folke/todo-comments.nvim",
		-- url = "https://github.com/folke/todo-comments.nvim",
    event = "VeryLazy",
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
		-- config = conf.todo,
    opts = opts.todo,
		keys = keys.todo,
	},
}
