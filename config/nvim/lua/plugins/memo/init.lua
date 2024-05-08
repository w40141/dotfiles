local conf = require("plugins.memo.config")
local setup = require("plugins.memo.setup")

return {
	{
		-- TODO: setting
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = conf.orgmode,
	},
	{
		"glidenote/memolist.vim",
		-- url = "https://github.com/glidenote/memolist.vim"
		cmd = {
			"MemoNew",
			"MemoGrep",
			"MemoList",
			"MemoCommit",
		},
		config = conf.memolist,
		init = setup.memolist,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		-- lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		event = {
			-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
			"BufReadPre ~/ghq/github/w40141/vault/**.md",
			"BufNewFile ~/ghq/github/w40141/vault/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = {
			"ObsidianCheck",
			"ObsidianToday",
			"ObsidianYesterday",
			"ObsidianTomorrow",
			"ObsidianNew",
			"ObsidianOpen",
			"ObsidianBacklinks",
			"ObsidianSearch",
			"ObsidianTemplate",
			"ObsidianQuickSwitch",
			"ObsidianLinkNew",
			"ObsidianLink",
			"ObsidianFollowLink",
			"ObsidianWorkspace",
			"ObsidianRename",
			"ObsidianPasteImg",
		},
		config = conf.obsidian,
	},
}
