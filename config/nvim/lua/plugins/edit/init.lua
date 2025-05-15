local conf = require("plugins.edit.config")
local keys = require("plugins.edit.keys")

return {
	{
		-- Add/change/delete surrounding delimiter pairs with ease.
		"kylechui/nvim-surround",
		-- url = "https://github.com/kylechui/nvim-surround",
		-- config = conf.surround,
		opts = {},
		event = { "FocusLost", "CursorHold" },
	},
	{
		-- Comment out
		"numToStr/Comment.nvim",
		-- url = "https://github.com/numToStr/Comment.nvim",
		-- config = conf.comment,
		opts = {
			pre_hook = function()
				return require("ts_context_commentstring.internal").calculate_commentstring()
			end,
		},
		event = { "FocusLost", "CursorHold" },
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		-- Improved Yank and Put functionalities for Neovim
		"gbprod/yanky.nvim",
		-- url = "https://github.com/gbprod/yanky.nvim",
		-- config = conf.yanky,
		opts = {
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
			},
			system_clipboard = { sync_with_ring = true },
		},
		keys = keys.yanky,
	},
	{
		-- Not UFO in the sky, but an ultra fold in Neovim.
		"kevinhwang91/nvim-ufo",
		-- url = "https://github.com/kevinhwang91/nvim-ufo"
		-- config = conf.ufo,
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		},
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
		opts = {
			default_keymapings_enalbled = false,
		},
		-- config = conf.textcase,
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
