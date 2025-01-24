local M = {}

function M.yanky()
	local key = vim.keymap.set
	key({ "n", "x" }, "p", "<Plug>(yankyPutAfter)", { desc = "[Yanky] カーソルの後ろにペースト" })
	key({ "n", "x" }, "P", "<Plug>(yankyPutBefore)", { desc = "[Yanky] カーソルの前にペースト" })
	key({ "n", "x" }, "gp", "<Plug>(yankyGPutAfter)", { desc = "[Yanky] セクションの後ろにペースト" })
	key({ "n", "x" }, "gP", "<Plug>(yankyGPutBefore)", { desc = "[Yanky] セクションの前にペースト" })
	key("n", "<c-n>", "<Plug>(yankyPreviousEntry)", { desc = "[Yanky] 前のヤンク履歴を選択" })
	key("n", "<c-p>", "<Plug>(yankyNextEntry)", { desc = "[Yanky] 次のヤンク履歴を選択" })
	key("n", "<c-y>", "<Cmd>yankyRingHistory<CR>", { desc = "[Yanky] ヤンク履歴を表示" })
	key(
		"n",
		"]p",
		"<Plug>(yankyPutIndentAfterLinewise)",
		{ desc = "[yanky] 後ろにインデント付きでペースト" }
	)
	key(
		"n",
		"[p",
		"<Plug>(yankyPutIndentBeforeLinewise)",
		{ desc = "[yanky] 前にインデント付きでペースト" }
	)
	key(
		"n",
		"]P",
		"<Plug>(yankyPutIndentAfterLinewise)",
		{ desc = "[yanky] セクションの後ろにインデント付きでペースト" }
	)
	key(
		"n",
		"[P",
		"<Plug>(yankyPutIndentBeforeLinewise)",
		{ desc = "[yanky] セクションの前にインデント付きでペースト" }
	)
	key(
		"n",
		">p",
		"<Plug>(yankyPutIndentAfterShiftRight)",
		{ desc = "[yanky] 後ろにインデント付きで右シフト" }
	)
	key(
		"n",
		"<p",
		"<Plug>(yankyPutIndentAfterShiftLeft)",
		{ desc = "[yanky] 後ろにインデント付きで左シフト" }
	)
	key(
		"n",
		">P",
		"<Plug>(yankyPutIndentBeforeShiftRight)",
		{ desc = "[yanky] セクションの後ろにインデント付きで右シフト" }
	)
	key(
		"n",
		"<P",
		"<Plug>(yankyPutIndentBeforeShiftLeft)",
		{ desc = "[yanky] セクションの前にインデント付きで左シフト" }
	)
	key(
		"n",
		"=p",
		"<Plug>(yankyPutAfterFilter)",
		{ desc = "[yanky] 後ろにフィルターを適用してペースト" }
	)
	key(
		"n",
		"=P",
		"<Plug>(yankyPutBeforeFilter)",
		{ desc = "[yanky] 前にフィルターを適用してペースト" }
	)
end

function M.ufo()
	local function f(name)
		return function()
			return require("ufo")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "zR", f("openAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを開く" })
	key("n", "zM", f("closeAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを閉じる" })
	key("n", "zr", f("openFoldsExceptKinds"), { desc = "[nvim-ufo] 指定以外の折り畳みを開く" })
	key("n", "zm", f("closeFoldsWith"), { desc = "[nvim-ufo] 指定レベル以上の折り畳みを閉じる" })
end

return M
