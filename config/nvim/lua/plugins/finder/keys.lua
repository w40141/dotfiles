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

local function telescope(name)
	return function()
		return require("telescope.builtin")[name]()
	end
end

M.telescope = {
	{ "[FF]f", telescope("find_files"), { desc = "[telescope] ファイルを検索" } },
	{ "[FF]p", telescope("git_files"), { desc = "[telescope] Git管理されているファイルを検索" } },
	{ "[FF]g", telescope("live_grep"), { desc = "[telescope] 文字列をリアルタイム検索" } },
	{ "[FF]/", telescope("grep_string"), { desc = "[telescope] カーソル下の文字列を検索" } },
	{ "[FF]b", telescope("buffers"), { desc = "[telescope] 開いているバッファを検索" } },
	{
		"[FF]i",
		telescope("lsp_implementations"),
		{ desc = "[telescope] カーソル下の単語の実装を一覧表示" },
	},
	{
		"[FF]l",
		telescope("current_buffer_fuzzy_find"),
		{ desc = "[telescope] 現在のバッファ内を検索" },
	},
	{ "[FF]q", telescope("diagnostics"), { desc = "[telescope] 診断リストを表示" } },
	{
		"[FF]r",
		telescope("lsp_references"),
		{ desc = "[telescope] カーソル下の単語のLSP参照を一覧表示" },
	},
	{
		"[FF]d",
		telescope("lsp_definitions"),
		{ desc = "[telescope] カーソル下の単語の定義を一覧表示" },
	},
	{
		"[FF]t",
		telescope("lsp_type_definitions"),
		{ desc = "[telescope] カーソル下の単語の型定義を一覧表示" },
	},
	{
		"[FF]c",
		telescope("spell_suggest"),
		{ desc = "[telescope] カーソル下の単語のスペル候補を一覧表示し置換" },
	},
	{
		"[FF]Gs",
		telescope("git_status"),
		{ desc = "[telescope] Gitの変更ファイルを一覧表示（差分プレビューあり）" },
	},
	{ "[FF]Gc", telescope("git_commits"), { desc = "[telescope] Gitコミット履歴を一覧表示" } },
	{
		"[FF]GC",
		telescope("git_bcommits"),
		{
			desc = "[telescope] 現在のバッファのGitコミット履歴を表示（差分プレビューあり）",
		},
	},
	{ "[FF]gb", telescope("git_branches"), { desc = "[telescope] Gitブランチを一覧表示" } },
	{ "[FF]ml", "<cmd>Telescope memo list<cr>", { desc = "[telescope] メモ一覧を表示" } },
	{ "[FF]mg", "<cmd>Telescope memo live_grep<cr>", { desc = "[telescope] メモをリアルタイム検索" } },
}

return M
