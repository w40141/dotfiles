local M = {}

M.conflict = {
	{
		"[GIT]o",
		"<cmd>GitConflictChooseOurs",
		{ desc = "[git-conflict] 現在の変更を選択 (ours)" },
	},
	{
		"[GIT]t",
		"<cmd>GitConflictChooseTheirs",
		{ desc = "[git-conflict] 相手の変更を選択 (theirs)" },
	},
	{
		"[GIT]b",
		"<cmd>GitConflictChooseBoth",
		{ desc = "[git-conflict] 両方の変更を選択 (both)" },
	},
	{
		"[GIT]0",
		"<cmd>GitConflictChooseNone",
		{ desc = "[git-conflict] 競合を削除 (none)" },
	},
	{
		"{GIT]q",
		"<cmd>GitConflictListQf",
		{ desc = "[git-conflict] QuickFixですべてを表示" },
	},
	{

		"[x",
		"<cmd>GitConflictPrevConflict",
		{ desc = "[git-conflict] 前の競合へ移動" },
	},
	{

		"]x",
		"<cmd>GitConflictNextConflict",
		{ desc = "[git-conflict] 次の競合へ移動" },
	},
}

return M
