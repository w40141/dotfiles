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
	{
		-- Comment out
		"numToStr/Comment.nvim",
		-- url = "https://github.com/numToStr/Comment.nvim",
		config = conf.comment,
		event = { "FocusLost", "CursorHold" },
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
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
		init = setup.ufo,
		config = conf.ufo,
		event = "VeryLazy",
	},
	{
		"kevinhwang91/promise-async",
	},
}
