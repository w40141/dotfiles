local M = {}

function M.conflict()
	local key = vim.keymap.set

	-- git-conflict.nvim プラグインに関連するキーバインド
	key("n", "co", "<Plug>(git-conflict-ours)", { desc = "[git-conflict] 現在の変更を選択 (ours)" })
	key("n", "ct", "<Plug>(git-conflict-theirs)", { desc = "[git-conflict] 相手の変更を選択 (theirs)" })
	key("n", "cb", "<Plug>(git-conflict-both)", { desc = "[git-conflict] 両方の変更を選択 (both)" })
	key("n", "c0", "<Plug>(git-conflict-none)", { desc = "[git-conflict] 競合を削除 (none)" })
	key("n", "[x", "<Plug>(git-conflict-prev-conflict)", { desc = "[git-conflict] 前の競合へ移動" })
	key("n", "]x", "<Plug>(git-conflict-next-conflict)", { desc = "[git-conflict] 次の競合へ移動" })
end

return M
