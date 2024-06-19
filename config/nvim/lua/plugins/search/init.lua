local conf = require("plugins.search.config")
local setup = require("plugins.search.setup")

return {
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
		dependencies = {
			"rapan931/lasterisk.nvim",
		},
		init = setup.hlslens,
		config = conf.hlslens,
		event = "VeryLazy",
	},
	{
		"lambdalisue/kensaku.vim",
		-- url = "https://github.com/lambdalisue/vim-kensaku",
		dependencies = {
			"vim-denops/denops.vim",
		},
	},
	{
		"lambdalisue/vim-kensaku-command",
		-- url = "https://github.com/lambdalisue/vim-kensaku-command",
		dependencies = {
			"lambdalisue/kensaku.vim",
		},
		cmd = { "Kensaku" },
	},
	-- {
	-- 	"lambdalisue/vim-kensaku-search",
	-- 	-- url = "https://github.com/lambdalisue/vim-kensaku-search"
	-- 	dependencies = {
	-- 		"lambdalisue/kensaku.vim",
	-- 	},
	-- 	init = setup.kensaku,
	-- },
}
