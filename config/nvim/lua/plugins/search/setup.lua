local M = {}

function M.quickhl()
	local key = vim.keymap.set
	key({ "n", "x" }, ",m", "<plug>(quickhl-manual-this)", { desc = "[quickhl] 現在の単語をマークする" })
	key(
		{ "n", "x" },
		",M",
		"<plug>(quickhl-manual-reset)",
		{ desc = "[quickhl] すべてのマークをリセットする" }
	)
end

function M.hlslens()
	local key = vim.keymap.set
	key(
		"n",
		"n",
		[[<CMD>execute('normal!'.v:count1.'n')<CR><CMD>lua require('hlslens').start()<CR>]],
		{ desc = "[hlslens] 次の検索結果へ移動" }
	)
	key(
		"n",
		"N",
		[[<CMD>execute('normal!'.v:count1.'N')<CR><CMD>lua require('hlslens').start()<CR>]],
		{ desc = "[hlslens] 前の検索結果へ移動" }
	)
	key("n", "*", function()
		require("lasterisk").search()
		require("hlslens").start()
	end, { desc = "[hlslens] 現在の単語を検索" })

	key({ "n", "x" }, "g*", function()
		require("lasterisk").search({ is_whole = false })
		require("hlslens").start()
	end, { desc = "[hlslens] 現在の単語を部分一致で検索" })
	key("n", "<c-c>", "<CMD>nohlsearch<CR>", { desc = "[hlslens] 検索ハイライトをクリア" })
end

function M.kensaku()
	local key = vim.keymap.set
	key("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { desc = "[kensaku] 置換検索を実行" })
end

return M
