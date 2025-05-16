local M = {}

local v = vim

local function d(name)
	return function()
		return v.diagnostic[name]()
	end
end

local function b(name)
	return function()
		return v.lsp.buf[name]()
	end
end

M.lspconfig = {
	{ "[DEV]o", d("open_float"), { desc = "[LSP] 診断メッセージを表示" } },
	{ "[DEV]q", d("setloclist"), { desc = "[LSP] 診断メッセージをローカルリストに設定" } },
	{ "]d", d("goto_next"), { desc = "[LSP] 次の診断メッセージへ移動" } },
	{ "[d", d("goto_prev"), { desc = "[LSP] 前の診断メッセージへ移動" } },

	{ "[DEV]a", b("code_action"), mode = { "n", "v" }, { desc = "[LSP] コードアクションを適用" } },
	{ "[DEV]r", b("references"), { desc = "[LSP] 参照を表示" } },
	{ "[DEV]d", b("definition"), { desc = "[LSP] 定義へ移動" } },
	{ "[DEV]D", b("declaration"), { desc = "[LSP] 宣言へ移動" } },
	{ "[DEV]i", b("implementation"), { desc = "[LSP] 実装へ移動" } },
	{ "[DEV]t", b("type_definition"), { desc = "[LSP] 型定義へ移動" } },
	{ "[DEV]n", b("rename"), { desc = "[LSP] シンボル名をリネーム" } },
	{ "[DEV]s", b("signature_help"), { desc = "[LSP] シグネチャヘルプを表示" } },
	{ "[DEV]wa", b("add_workspace_folder"), { desc = "[LSP] ワークスペースフォルダを追加" } },
	{ "[DEV]wr", b("remove_workspace_folder"), { desc = "[LSP] ワークスペースフォルダを削除" } },
	{
		"[DEV]wl",
		function()
			print(v.inspect(b("list_workspace_folders")))
		end,
		{ desc = "[LSP] ワークスペースフォルダ一覧を表示" },
	},
}

return M
