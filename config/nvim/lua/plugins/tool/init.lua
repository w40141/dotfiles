local conf = require("plugins.tool.config")
local setup = require("plugins.tool.setup")

return {
	{
		"glidenote/memolist.vim",
		-- url = "https://github.com/glidenote/memolist.vim"
		cmd = {
			"MemoNew",
			"MemoGrep",
		},
		config = conf.memolist,
		init = setup.memolist,
	},
	{
		"dstein64/vim-startuptime",
		-- url = "https://github.com/dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		-- Generating images of source code using
		"segeljakt/vim-silicon",
		-- url = "https://github.com/segeljakt/vim-silicon",
		cmd = "Silicon",
	},
	{
		-- Open URI
		"tyru/open-browser.vim",
		-- url = "https://github.com/tyru/open-browser.vim",
		keys = {
			{ "<plug>(openbrowser-smart-search)", mode = "n" },
		},
		init = setup.open_browser,
	},
	{
		-- Delete buffers
		"famiu/bufdelete.nvim",
		-- url = "https://github.com/famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		event = "CmdlineEnter",
	},
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		-- url = "https://github.com/akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		config = conf.toggleterm,
		init = setup.toggleterm,
	},
	{
		-- Resizing of windows
		"simeji/winresizer",
		-- url = "https://github.com/simeji/winresizer",
		keys = {
			{ "<C-e>", mode = "n" },
		},
		init = setup.winresizer,
	},
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		-- url = "https://github.com/t9md/vim-quickhl",
		keys = {
			{ "<Plug>(quickhl-manual-this)", mode = "n" },
			{ "<Plug>(quickhl-manual-reset)", mode = "n" },
		},
		init = setup.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		-- url = "https://github.com/kevinhwang91/nvim-hlslens",
		keys = {
			{ "*", mode = "n" },
			{ "g*", mode = "n" },
			{ "g*", mode = "n" },
		},
		event = { "CmdlineEnter" },
		dependencies = {
			"rapan931/lasterisk.nvim",
		},
		init = setup.hlslens,
		config = conf.hlslens,
	},
	{
		-- simply window selector for neovim written in lua
		"tkmpypy/chowcho.nvim",
		-- url = "https://github.com/tkmpypy/chowcho.nvim"
		config = conf.chowcho,
		cmd = { "Chowcho" },
		keys = { "<C-w><C-w>", mode = "n" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<C-s>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		-- lazy = true,
		-- ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
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
