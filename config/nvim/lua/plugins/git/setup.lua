local M = {}

function M.conflict()
	local key = vim.keymap.set

	-- git-conflict.nvim プラグインに関連するキーバインド
	key("n", "co", "<cmd>GitConflictChooseOurs", { desc = "[git-conflict] 現在の変更を選択 (ours)" })
	key("n", "ct", "<cmd>GitConflictChooseTheirs", { desc = "[git-conflict] 相手の変更を選択 (theirs)" })
	key("n", "cb", "<cmd>GitConflictChooseBoth", { desc = "[git-conflict] 両方の変更を選択 (both)" })
	key("n", "c0", "<cmd>GitConflictChooseNone", { desc = "[git-conflict] 競合を削除 (none)" })
	key("n", "[x", "<cmd>GitConflictPrevConflict", { desc = "[git-conflict] 前の競合へ移動" })
	key("n", "]x", "<cmd>GitConflictNextConflict", { desc = "[git-conflict] 次の競合へ移動" })
	key("n", "cq", "<cmd>GitConflictListQf", { desc = "[git-conflict] QuickFixですべてを表示" })
end

return M
