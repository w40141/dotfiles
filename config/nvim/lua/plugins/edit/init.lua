local setup = require("plugins.edit.setup")
local conf = require("plugins.edit.config")

return {
	{
		-- Add/change/delete surrounding delimiter pairs with ease.
		"kylechui/nvim-surround",
		-- url = "https://github.com/kylechui/nvim-surround",
		version = "*",
		config = conf.surround,
		event = "VeryLazy",
	},
	-- {
	-- 	-- eskk is pure Vim script implementation of input method engine SKK
	-- 	"vim-skk/eskk.vim",
	-- 	-- url = "https://github.com/vim-skk/eskk.vim",
	-- 	init = setup.eskk,
	-- 	config = conf.eskk,
	-- 	event = { "InsertEnter" },
	-- },
	{
		-- Comment out
		"numToStr/Comment.nvim",
		-- url = "https://github.com/numToStr/Comment.nvim",
		config = conf.comment,
		-- event = { "BufReadPre", "FocusLost", "CursorHold" },
		event = { "FocusLost", "CursorHold" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		-- Improved Yank and Put functionalities for Neovim
		"gbprod/yanky.nvim",
		-- url = "https://github.com/gbprod/yanky.nvim",
		init = setup.yanky,
		config = conf.yanky,
		event = "VeryLazy",
	},
	{
		-- Not UFO in the sky, but an ultra fold in Neovim.
		"kevinhwang91/nvim-ufo",
		-- url = "https://github.com/kevinhwang91/nvim-ufo"
		dependencies = { "kevinhwang91/promise-async" },
		init = setup.ufo,
		config = conf.ufo,
		event = "VeryLazy",
	},
}
