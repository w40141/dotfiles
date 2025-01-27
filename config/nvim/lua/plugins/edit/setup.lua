local M = {}

function M.yanky()
	local key = vim.keymap.set
	key({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "[yanky] カーソルの後ろにペースト" })
	key({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "[yanky] カーソルの前にペースト" })
	key({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "[yanky] セクションの後ろにペースト" })
	key({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "[yanky] セクションの前にペースト" })
	key("n", "<c-n>", "<Plug>(YankyPreviousEntry)", { desc = "[yanky] 前のヤンク履歴を選択" })
	key("n", "<c-p>", "<Plug>(YankyNextEntry)", { desc = "[yanky] 次のヤンク履歴を選択" })
	key("n", "<c-y>", "<Cmd>YankyRingHistory<CR>", { desc = "[yanky] ヤンク履歴を表示" })
	key(
		"n",
		"]p",
		"<Plug>(YankyPutIndentAfterLinewise)",
		{ desc = "[yanky] 後ろにインデント付きでペースト" }
	)
	key(
		"n",
		"[p",
		"<Plug>(YankyPutIndentBeforeLinewise)",
		{ desc = "[yanky] 前にインデント付きでペースト" }
	)
	key(
		"n",
		"]P",
		"<Plug>(YankyPutIndentAfterLinewise)",
		{ desc = "[yanky] セクションの後ろにインデント付きでペースト" }
	)
	key(
		"n",
		"[P",
		"<Plug>(YankyPutIndentBeforeLinewise)",
		{ desc = "[yanky] セクションの前にインデント付きでペースト" }
	)
	key(
		"n",
		">p",
		"<Plug>(YankyPutIndentAfterShiftRight)",
		{ desc = "[yanky] 後ろにインデント付きで右シフト" }
	)
	key(
		"n",
		"<p",
		"<Plug>(YankyPutIndentAfterShiftLeft)",
		{ desc = "[yanky] 後ろにインデント付きで左シフト" }
	)
	key(
		"n",
		">P",
		"<Plug>(YankyPutIndentBeforeShiftRight)",
		{ desc = "[yanky] セクションの後ろにインデント付きで右シフト" }
	)
	key(
		"n",
		"<P",
		"<Plug>(YankyPutIndentBeforeShiftLeft)",
		{ desc = "[yanky] セクションの前にインデント付きで左シフト" }
	)
	key(
		"n",
		"=p",
		"<Plug>(YankyPutAfterFilter)",
		{ desc = "[yanky] 後ろにフィルターを適用してペースト" }
	)
	key(
		"n",
		"=P",
		"<Plug>(YankyPutBeforeFilter)",
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
