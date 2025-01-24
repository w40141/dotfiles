local conf = require("plugins.finder.config")
local setup = require("plugins.finder.setup")

return {
	{
		-- Fzf finder
		"nvim-telescope/telescope.nvim",
		-- url = "https://github.com/nvim-telescope/telescope.nvim",
		cmd = {
			"Telescope",
		},
		init = setup.telescope,
		config = conf.telescope,
	},
	{
		"folke/trouble.nvim",
		-- url = "https://github.com/folke/trouble.nvim",
		cmd = { "Trouble" },
		init = setup.trouble,
		config = conf.trouble,
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
		event = { "FocusLost", "CursorHold" },
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
		init = setup.todo,
		config = conf.todo,
	},
}
