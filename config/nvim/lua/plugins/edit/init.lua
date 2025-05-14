local conf = require("plugins.edit.config")
local keys = require("plugins.edit.keys")

return {
	{
		-- Add/change/delete surrounding delimiter pairs with ease.
		"kylechui/nvim-surround",
		-- url = "https://github.com/kylechui/nvim-surround",
		config = conf.surround,
		event = { "FocusLost", "CursorHold" },
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
		config = conf.yanky,
		keys = keys.yanky,
	},
	{
		-- Not UFO in the sky, but an ultra fold in Neovim.
		"kevinhwang91/nvim-ufo",
		-- url = "https://github.com/kevinhwang91/nvim-ufo"
		config = conf.ufo,
		keys = keys.ufo,
	},
	{
		"kevinhwang91/promise-async",
	},
	{
		"monaqa/dial.nvim",
		-- url = "https://github.com/monaqa/dial.nvim",
		config = conf.dial,
		keys = keys.dial,
	},
	{
		"johmsalas/text-case.nvim",
		-- url =https://github.com/johmsalas/text-case.nvim
		config = conf.textcase,
		keys = keys.textcase,
		cmd = {
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
	},
}
