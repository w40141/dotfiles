local conf = require("plugins.search.config")
-- local setup = require("plugins.search.setup")
local keys = require("plugins.search.keys")

return {
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		-- url = "https://github.com/t9md/vim-quickhl",
		-- keys = {
		-- 	{ "<Plug>(quickhl-manual-this)", mode = "n" },
		-- 	{ "<Plug>(quickhl-manual-reset)", mode = "n" },
		-- },
		-- init = setup.quickhl,
    keys = keys.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		-- url = "https://github.com/kevinhwang91/nvim-hlslens",
		-- init = setup.hlslens,
		config = conf.hlslens,
		-- event = "VeryLazy",
    keys = keys.hlslens,
	},
	{
		"rapan931/lasterisk.nvim",
	},
	{
		"lambdalisue/kensaku.vim",
		-- url = "https://github.com/lambdalisue/vim-kensaku",
		dependencies = {
			"vim-denops/denops.vim",
		},
		event = "VeryLazy",
	},
	{
		"lambdalisue/vim-kensaku-command",
		-- url = "https://github.com/lambdalisue/vim-kensaku-command",
		event = { "CmdlineEnter" },
	},
	{
		"lambdalisue/vim-kensaku-search",
		-- url = "https://github.com/lambdalisue/vim-kensaku-search"
		config = conf.kensaku,
		event = { "CmdlineEnter" },
	},
}
