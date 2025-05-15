local conf = require("plugins.search.config")
local keys = require("plugins.search.keys")

return {
	{
		-- quickly highlight <cword> or visually selected word
		"t9md/vim-quickhl",
		-- url = "https://github.com/t9md/vim-quickhl",
    keys = keys.quickhl,
	},
	{
		-- Highlight length of search result
		"kevinhwang91/nvim-hlslens",
		-- url = "https://github.com/kevinhwang91/nvim-hlslens",
		-- config = conf.hlslens,
    opts = {},
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
    -- keys = keys.kensaku,
		event = { "CmdlineEnter" },
	},
}
