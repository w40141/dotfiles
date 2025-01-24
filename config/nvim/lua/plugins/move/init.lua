local setup = require("plugins.move.setup")
local conf = require("plugins.move.config")

return {
	{
		-- Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.
		"chrisgrieser/nvim-spider",
		-- url = "https://github.com/chrisgrieser/nvim-spider"
		lazy = true,
		init = setup.spider,
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
		-- Navigate your code with search labels, enhanced character motions and Treesitter integration
		"folke/flash.nvim",
		-- url = "https://github.com/folke/flash.nvim"
		init = setup.flash,
		event = "VeryLazy",
	},
	{
		"s-show/extend_word_motion.nvim",
		-- url = "https://github.com/s-show/extend_word_motion.nvim"
		opts = {},
		dependencies = {
			"sirasagi62/tinysegmenter.nvim",
		},
		event = "VeryLazy",
	},
}
