local M = {}

function M.todo()
	local key = vim.keymap.set
	key("n", "[ff]O", "<cmd>TodoTelescope<CR>", { desc = "[todo-comment] TelescopeでTODOを検索" })
	key("n", "[ff]o", "<cmd>TodoTrouble<CR>", { desc = "[todo-comment] TroubleでTODOを検索" })
end

function M.trouble()
	local key = vim.keymap.set
	key("n", "[ff]Q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[trouble] 診断リストを表示" })
	key(
		"n",
		"[ff]R",
		"<cmd>Trouble lsp_references<cr>",
		{ desc = "[trouble] カーソル下の単語のLSP参照を一覧表示" }
	)
	key(
		"n",
		"[ff]D",
		"<cmd>Trouble lsp_definitions<cr>",
		{ desc = "[trouble] カーソル下の単語の定義を一覧表示" }
	)
	key(
		"n",
		"[ff]T",
		"<cmd>Trouble lsp_type_definitions<cr>",
		{ desc = "[trouble] カーソル下の単語の型定義を一覧表示" }
	)
end

function M.telescope()
	local function f(name)
		return function()
			return require("telescope.builtin")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "[ff]f", f("find_files"), { desc = "[telescope] ファイルを検索" })
	key("n", "[ff]p", f("git_files"), { desc = "[telescope] Git管理されているファイルを検索" })
	key("n", "[ff]g", f("live_grep"), { desc = "[telescope] 文字列をリアルタイム検索" })
	key("n", "[ff]/", f("grep_string"), { desc = "[telescope] カーソル下の文字列を検索" })
	key("n", "[ff]b", f("buffers"), { desc = "[telescope] 開いているバッファを検索" })
	key("n", "[ff]l", f("current_buffer_fuzzy_find"), { desc = "[telescope] 現在のバッファ内を検索" })
	key("n", "[ff]q", f("diagnostics"), { desc = "[telescope] 診断リストを表示" })
	key("n", "[ff]r", f("lsp_references"), { desc = "[telescope] カーソル下の単語のLSP参照を一覧表示" })
	key("n", "[ff]d", f("lsp_definitions"), { desc = "[telescope] カーソル下の単語の定義を一覧表示" })
	key(
		"n",
		"[ff]t",
		f("lsp_type_definitions"),
		{ desc = "[telescope] カーソル下の単語の型定義を一覧表示" }
	)
	key(
		"n",
		"[ff]c",
		f("spell_suggest"),
		{ desc = "[telescope] カーソル下の単語のスペル候補を一覧表示し置換" }
	)
	key(
		"n",
		"[ff]gs",
		f("git_status"),
		{ desc = "[telescope] Gitの変更ファイルを一覧表示（差分プレビューあり）" }
	)
	key("n", "[ff]gc", f("git_commits"), { desc = "[telescope] Gitコミット履歴を一覧表示" })
	key(
		"n",
		"[ff]gC",
		f("git_bcommits"),
		{ desc = "[telescope] 現在のバッファのGitコミット履歴を表示（差分プレビューあり）" }
	)
	key("n", "[ff]gb", f("git_branches"), { desc = "[telescope] Gitブランチを一覧表示" })
	key("n", "[ff]ml", "<cmd>Telescope memo list<cr>", { desc = "[telescope] メモ一覧を表示" })
	key("n", "[ff]mg", "<cmd>Telescope memo live_grep<cr>", { desc = "[telescope] メモをリアルタイム検索" })
end

return M
