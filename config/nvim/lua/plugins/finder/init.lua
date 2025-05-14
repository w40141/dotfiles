local conf = require("plugins.finder.config")
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
		config = conf.trouble,
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
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
		config = conf.todo,
		keys = keys.todo,
	},
}
