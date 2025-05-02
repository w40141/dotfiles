local M = {}

-- key("n", "[BUF]d", "<cmd>Bdelete<cr>", { desc = "[bufferline] 前のバッファを削除" })
-- key("n", "[BUF]w", "<cmd>Bwipeout<cr>", { desc = "[bufferline] バッファを完全に削除" })
-- key("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "[bufferline] 前のバッファに移動" })
-- key("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "[bufferline] 次のバッファに移動" })
-- key("n", "[BUF]E", "<cmd>BufferLineSortByExtension<cr>", { desc = "[bufferline] 拡張子で並べ替え" })
-- key("n", "[BUF]D", "<cmd>BufferLineSortByDirectory<cr>", { desc = "[bufferline] ディレクトリで並べ替え" })
-- key("n", "[BUF]g", "<cmd>BufferLinePick<cr>", { desc = "[bufferline] バッファを選択" })
M.bufferline = {
	{
		"[BUF]d",
		"<cmd>Bdelete<cr>",
		{ desc = "[bufferline] 前のバッファを削除" },
	},
	{
		"[BUF]w",
		"<cmd>Bwipeout<cr>",
		{ desc = "[bufferline] バッファを完全に削除" },
	},
	{
		"[b",
		"<cmd>BufferLineCyclePrev<cr>",
		{ desc = "[bufferline] 前のバッファに移動" },
	},
	{
		"]b",
		"<cmd>BufferLineCycleNext<cr>",
		{ desc = "[bufferline] 次のバッファに移動" },
	},
	{
		"[BUF]E",
		"<cmd>BufferLineSortByExtension<cr>",
		{ desc = "[bufferline] 拡張子で並べ替え" },
	},
	{
		"[BUF]D",
		"<cmd>BufferLineSortByDirectory<cr>",
		{ desc = "[bufferline] ディレクトリで並べ替え" },
	},
	{
		"[BUF]g",
		"<cmd>BufferLinePick<cr>",
		{ desc = "[bufferline] バッファを選択" },
	},
}

M.aerial = {
	{ "gt", "<cmd>AerialToggle<cr>", { desc = "[aerial] アウトライナーを切り替る" } },
}

M.tree = {
  {
		"<leader>e",
		"<cmd>NvimTreeFindFileToggle<cr>",
		{ desc = "[NvimTree] NvimTree を切り替え" }
  },
}

return M
