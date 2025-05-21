local conf = require("plugins.git.config")
local keys = require("plugins.git.keys")

return {
	{
		"NeogitOrg/neogit",
		-- url = "https://github.com/NeogitOrg/neogit",
		cmd = { "Neogit" },
		opts = {
			integrations = {
				telescope = true,
				diffview = true,
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		-- url = "https://github.com/sindrets/diffview.nvim",
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
		-- event = "VeryLazy",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = conf.gitsigns,
	},
	{
		"akinsho/git-conflict.nvim",
		-- url = "https://github.com/akinsho/git-conflict.nvim",
		version = "*",
    opts = {},
		-- init = setup.conflict,
		cmd = {
			"GitConflictChooseOurs",
			"GitConflictChooseTheirs",
			"GitConflictChooseBoth",
			"GitConflictChooseNone",
			"GitConflictNextConflict",
			"GitConflictPrevConflict",
			"GitConflictListQf",
		},
		keys = keys.conflict,
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
