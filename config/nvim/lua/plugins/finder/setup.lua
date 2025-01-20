local M = {}

function M.todo()
	local key = vim.keymap.set
	key("n", "[ff]O", "<cmd>TodoTelescope<CR>", { desc = "Find TODO Comments in Telescope" })
	key("n", "[ff]o", "<cmd>TodoTrouble<CR>", { desc = "Find TODO Comments in Trouble" })
	key("n", "[ff]u", "<cmd>TodoQuickFix<CR>", { desc = "Find TODO Comments in QuickFix" })
end

-- TODO: キーバインドを修正する
-- https://github.com/folke/trouble.nvim?tab=readme-ov-file#lazynvim
function M.trouble()
	local key = vim.keymap.set
	key("n", "[ff]Q", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Workspace Diagnostics" })
	key("n", "[ff]R", "<cmd>Trouble lsp_references<cr>", { desc = "Trouble LSP References" })
	key("n", "[ff]D", "<cmd>Trouble lsp_definitions<cr>", { desc = "Trouble LSP Definitions" })
	key("n", "[ff]T", "<cmd>Trouble lsp_type_definitions<cr>", { desc = "Trouble LSP Type Definitions" })
end

function M.telescope()
	local function f(name)
		return function()
			return require("telescope.builtin")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "[ff]f", f("find_files"), { desc = "Telescope: ファイルを検索する" })
	key("n", "[ff]p", f("git_files"), { desc = "Telescope: Gitに追跡されているファイルを検索する" })
	key("n", "[ff]g", f("live_grep"), { desc = "Telescope: 文字列をライブ検索する" })
	key("n", "[ff]/", f("grep_string"), { desc = "カーソル下にある文字列を検索する" })
	key("n", "[ff]b", f("buffers"), { desc = "バッファ内を検索する" })
	key("n", "[ff]l", f("current_buffer_fuzzy_find"), { desc = "現在のバッファ内を検索する" })
	key("n", "[ff]q", f("diagnostics"), { desc = "診断結果のリストを表示する" })
	key("n", "[ff]r", f("lsp_references"), { desc = "カーソル下の単語のLSP参照を一覧表示する" })
	key("n", "[ff]d", f("lsp_definitions"), { desc = "カーソル下の単語の定義に移動する" })
	key("n", "[ff]t", f("lsp_type_definitions"), { desc = "カーソル下の単語の種類の定義に移動する" })
	key("n", "[ff]c", f("spell_suggest"), {
		desc = "カーソル下の単語のスペル候補を一覧表示し、選択した候補で単語を置き換えます",
	})
	key("n", "[ff]gs", f("git_status"), {
		desc = "ファイルごとの現在の変更を、差分プレビューと追加アクションを一覧表示する",
	})
	key("n", "[ff]gc", f("git_commits"), { desc = "gitコミットを一覧表示する" })
	key(
		"n",
		"[ff]gC",
		f("git_bcommits"),
		{ desc = "バッファのgitコミットを差分プレビュー付きで一覧表示する" }
	)
	key("n", "[ff]gb", f("git_branches"), { desc = "すべてのブランチを一覧表示する" })
	key("n", "[ff]ml", "<cmd>Telescope memo list<cr>", { desc = "Memo List" })
	key("n", "[ff]mg", "<cmd>Telescope memo live_grep<cr>", { desc = "Memo Live Grep" })
end

return M
