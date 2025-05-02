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
		config = conf.yanky,
		keys = {
			{ "p", "<Plug>(YankyPutAfter)", { "n", "x" }, { desc = "[yanky] カーソルの後ろにペースト" } },
			{ "P", "<Plug>(YankyPutBefore)", { "n", "x" }, { desc = "[yanky] カーソルの前にペースト" } },
			{
				"gp",
				"<Plug>(YankyGPutAfter)",
				{ "n", "x" },
				{ desc = "[yanky] セクションの後ろにペースト" },
			},
			{
				"gP",
				"<Plug>(YankyGPutBefore)",
				{ "n", "x" },
				{ desc = "[yanky] セクションの前にペースト" },
			},
			{ "<c-n>", "<Plug>(YankyPreviousEntry)", { desc = "[yanky] 前のヤンク履歴を選択" } },
			{ "<c-p>", "<Plug>(YankyNextEntry)", { desc = "[yanky] 次のヤンク履歴を選択" } },
			{ "<c-y>", "<Cmd>YankyRingHistory<CR>", { desc = "[yanky] ヤンク履歴を表示" } },
			{
				"]p",
				"<Plug>(YankyPutIndentAfterLinewise)",
				{ desc = "[yanky] 後ろにインデント付きでペースト" },
			},
			{
				"[p",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				{ desc = "[yanky] 前にインデント付きでペースト" },
			},
			{
				"]P",
				"<Plug>(YankyPutIndentAfterLinewise)",
				{ desc = "[yanky] セクションの後ろにインデント付きでペースト" },
			},
			{
				"[P",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				{ desc = "[yanky] セクションの前にインデント付きでペースト" },
			},
			{
				">p",
				"<Plug>(YankyPutIndentAfterShiftRight)",
				{ desc = "[yanky] 後ろにインデント付きで右シフト" },
			},
			{
				"<p",
				"<Plug>(YankyPutIndentAfterShiftLeft)",
				{ desc = "[yanky] 後ろにインデント付きで左シフト" },
			},
			{
				">P",
				"<Plug>(YankyPutIndentBeforeShiftRight)",
				{ desc = "[yanky] セクションの後ろにインデント付きで右シフト" },
			},
			{
				"<P",
				"<Plug>(YankyPutIndentBeforeShiftLeft)",
				{ desc = "[yanky] セクションの前にインデント付きで左シフト" },
			},
			{
				"=p",
				"<Plug>(YankyPutAfterFilter)",
				{ desc = "[yanky] 後ろにフィルターを適用してペースト" },
			},
			{
				"=P",
				"<Plug>(YankyPutBeforeFilter)",
				{ desc = "[yanky] 前にフィルターを適用してペースト" },
			},
		},
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
	{
		"monaqa/dial.nvim",
		-- url = "https://github.com/monaqa/dial.nvim",
		init = setup.dial,
		config = conf.dial,
		event = "VeryLazy",
	},
}
