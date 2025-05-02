local M = {}

local function ufo(name)
	return function()
		return require("ufo")[name]()
	end
end

M.ufo = {
	{ "zR", ufo("openAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを開く" } },
	{ "zM", ufo("closeAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを閉じる" } },
	{ "zr", ufo("openFoldsExceptKinds"), { desc = "[nvim-ufo] 指定以外の折り畳みを開く" } },
	{ "zm", ufo("closeFoldsWith"), { desc = "[nvim-ufo] 指定レベル以上の折り畳みを閉じる" } },
}

M.yanky = {
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
}

M.dial = {
	{ "<C-a>", "<Plug>(dial-increment)", mode = { "n", "v" }, { desc = "[dial] インクリメント" } },
	{ "<C-x>", "<Plug>(dial-decrement)", mode = { "n", "v" }, { desc = "[dial] デクリメント" } },
	{ "g<C-a>", "g<Plug>(dial-increment)", mode = { "n", "v" }, { desc = "[dial] インクリメント" } },
	{ "g<C-x>", "g<Plug>(dial-decrement)", mode = { "n", "v" }, { desc = "[dial] デクリメント" } },
}

return M
