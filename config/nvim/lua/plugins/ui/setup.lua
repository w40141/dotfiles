local M = {}

function M.lualine()
	local v = vim
	v.opt.laststatus = 0
	v.opt.showtabline = 0
end

function M.bufferline()
	local key = vim.keymap.set

	-- BufferLine プラグインに関連するキーバインド
	key("n", "[BUF]d", "<cmd>Bdelete<cr>", { desc = "[bufferline] 前のバッファを削除" })
	key("n", "[BUF]w", "<cmd>Bwipeout<cr>", { desc = "[bufferline] バッファを完全に削除" })
	key("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "[bufferline] 前のバッファに移動" })
	key("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "[bufferline] 次のバッファに移動" })
	key("n", "[BUF]E", "<cmd>BufferLineSortByExtension<cr>", { desc = "[bufferline] 拡張子で並べ替え" })
	key("n", "[BUF]D", "<cmd>BufferLineSortByDirectory<cr>", { desc = "[bufferline] ディレクトリで並べ替え" })
	key("n", "[BUF]g", "<cmd>BufferLinePick<cr>", { desc = "[bufferline] バッファを選択" })
end

function M.aerial()
	-- Aerial プラグインに関連するキーバインド
	vim.keymap.set("n", "gt", "<cmd>AerialToggle<cr>", { desc = "[aerial] アウトライナーを切り替る" })
end

function M.tree()
	-- NvimTree プラグインに関連するキーバインド
	vim.keymap.set(
		"n",
		"<leader>e",
		"<cmd>NvimTreeFindFileToggle<cr>",
		{ desc = "[NvimTree] NvimTree を切り替え" }
	)
end

return M
