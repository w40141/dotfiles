local M = {}

M.conflict = {
	{
		"[GIT]o",
		"<cmd>GitConflictChooseOurs<cr>",
		{ desc = "[git-conflict] 現在の変更を選択 (ours)" },
	},
	{
		"[GIT]t",
		"<cmd>GitConflictChooseTheirs<cr>",
		{ desc = "[git-conflict] 相手の変更を選択 (theirs)" },
	},
	{
		"[GIT]b",
		"<cmd>GitConflictChooseBoth<cr>",
		{ desc = "[git-conflict] 両方の変更を選択 (both)" },
	},
	{
		"[GIT]0",
		"<cmd>GitConflictChooseNone<cr>",
		{ desc = "[git-conflict] 競合を削除 (none)" },
	},
	{
		"[GIT]q",
		"<cmd>GitConflictListQf<cr>",
		{ desc = "[git-conflict] QuickFixですべてを表示" },
	},
	{

		"[x",
		"<cmd>GitConflictPrevConflict<cr>",
		{ desc = "[git-conflict] 前の競合へ移動" },
	},
	{

		"]x",
		"<cmd>GitConflictNextConflict<cr>",
		{ desc = "[git-conflict] 次の競合へ移動" },
	},
}

return M
