local conf = require("plugins.git.config")

return {
	{
		"NeogitOrg/neogit",
		-- url = "https://github.com/NeogitOrg/neogit",
		-- dependencies = {
		-- 	"nvim-lua/plenary.nvim",
		-- 	"sindrets/diffview.nvim",
		-- 	"nvim-telescope/telescope.nvim",
		-- },
		cmd = { "Neogit" },
		config = conf.neogit,
	},
	{
		"sindrets/diffview.nvim",
		-- url = "https://github.com/sindrets/diffview.nvim",
		-- dependencies = {
		-- 	"nvim-tree/nvim-web-devicons",
		-- },
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
			"DiffviewFileHistory",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		-- url = "https://github.com/lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = conf.gitsigns,
	},
	{
		"akinsho/git-conflict.nvim",
		-- url = "https://github.com/akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		event = "VeryLazy",
		cmd = {
			"GitConflictChooseOurs",
			"GitConflictChooseTheirs",
			"GitConflictChooseBoth",
			"GitConflictChooseNone",
			"GitConflictNextConflict",
			"GitConflictPrevConflict",
			"GitConflictListQf",
		},
	},
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	-- url = "https://github.com/pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup()
	-- 	end,
	-- },
}
