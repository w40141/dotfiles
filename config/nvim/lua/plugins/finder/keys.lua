local M = {}

M.todo = {
	{
		"[FF]o",
		"<cmd>TodoTelescope<cr>",
		{ desc = "[todo-comment] TelescopeでTODOを検索" },
	},
	{
		"[TR]o",
		"<cmd>TodoTrouble<cr>",
		{ desc = "[todo-comment] TroubleでTODOを検索" },
	},
}

M.trouble = {
	{
		"[TR]q",
		"<cmd>Trouble diagnostics toggle<cr>",
		{ desc = "[trouble] 診断リストを表示" },
	},
	{
		"[TR]r",
		"<cmd>Trouble lsp_references<cr>",
		{ desc = "[trouble] カーソル下の単語のLSP参照を一覧表示" },
	},
	{
		"[TR]d",
		"<cmd>Trouble lsp_definitions<cr>",
		{ desc = "[trouble] カーソル下の単語の定義を一覧表示" },
	},
	{
		"[TR]t",
		"<cmd>Trouble lsp_type_definitions<cr>",
		{ desc = "[trouble] カーソル下の単語の型定義を一覧表示" },
	},
}

return M
