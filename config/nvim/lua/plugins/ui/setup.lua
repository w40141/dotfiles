local M = {}

function M.lualine()
	local v = vim
	v.opt.laststatus = 0
	v.opt.showtabline = 0
end

function M.bufferline()
	local key = vim.keymap.set

	-- BufferLine プラグインに関連するキーバインド
	key("n", "<leader>bd", "<Cmd>Bdelete<cr>", { desc = "[bufferline] 前のバッファを削除" })
	key("n", "<leader>bw", "<Cmd>Bwipeout<cr>", { desc = "[bufferline] バッファを完全に削除" })
	key("n", "[b", "<Cmd>BufferLineCyclePrev<cr>", { desc = "[bufferline] 前のバッファに移動" })
	key("n", "]b", "<Cmd>BufferLineCycleNext<cr>", { desc = "[bufferline] 次のバッファに移動" })
	key("n", "bE", "<Cmd>BufferLineSortByExtension<cr>", { desc = "[bufferline] 拡張子で並べ替え" })
	key("n", "bD", "<Cmd>BufferLineSortByDirectory<cr>", { desc = "[bufferline] ディレクトリで並べ替え" })
	key("n", "bg", "<Cmd>BufferLinePick<cr>", { desc = "[bufferline] バッファを選択" })
end

function M.aerial()
	-- Aerial プラグインに関連するキーバインド
	vim.keymap.set("n", "gt", "<Cmd>AerialToggle<CR>", { desc = "[aerial] アウトライナーを切り替る" })
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
