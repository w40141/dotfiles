local M = {}

M.quickhl = {
	{
		",m",
		"<plug>(quickhl-manual-this)",
		mode = { "n", "x" },
		{ desc = "[quickhl] 現在の単語をマークする" },
	},
	{
		",M",
		"<plug>(quickhl-manual-reset)",
		mode = { "n", "x" },
		{ desc = "[quickhl] すべてのマークをリセットする" },
	},
}

M.hlslens = {
	{
		"n",
		[[<cmd>execute('normal!'.v:count1.'n')<cr><cmd>lua require('hlslens').start()<cr>]],
		{ desc = "[hlslens] 次の検索結果へ移動" },
	},
	{
		"N",
		[[<cmd>execute('normal!'.v:count1.'N')<cr><cmd>lua require('hlslens').start()<cr>]],
		{ desc = "[hlslens] 前の検索結果へ移動" },
	},
	{
		"*",
		function()
			require("hlslens").start()
			require("lasterisk").search()
		end,
		{ desc = "[hlslens] 現在の単語を検索" },
	},
	{
		"g*",
		function()
			require("hlslens").start()
			require("lasterisk").search({ is_whole = false })
		end,
		{ desc = "[hlslens] 現在の単語を部分一致で検索" },
	},
	{
		"<C-c>",
		"<cmd>nohlsearch<cr>",
		{ desc = "[hlslens] 検索ハイライトをクリア" },
	},
}

M.kensaku = {
	{
		"<CR>",
		"<plug>(kensaku-search-replace)<cr>",
		{ desc = "[kensaku] 置換検索を実行" },
	},
}

return M
