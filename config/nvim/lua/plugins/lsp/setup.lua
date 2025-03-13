local M = {}

function M.lspconfig()
	local v = vim
	local key = v.keymap.set

	local function d(name)
		return function()
			return v.diagnostic[name]()
		end
	end

	key("n", "[DEV]o", d("open_float"), { desc = "[LSP] 診断メッセージを表示" })
	key("n", "[DEV]q", d("setloclist"), { desc = "[LSP] 診断メッセージをローカルリストに設定" })
	key("n", "]g", d("goto_next"), { desc = "[LSP] 次の診断メッセージへ移動" })
	key("n", "[g", d("goto_prev"), { desc = "[LSP] 前の診断メッセージへ移動" })

	local function b(name)
		return function()
			return v.lsp.buf[name]()
		end
	end

	key("n", "[DEV]r", b("references"), { desc = "[LSP] 参照を表示" })
	key("n", "[DEV]d", b("definition"), { desc = "[LSP] 定義へ移動" })
	key("n", "[DEV]D", b("declaration"), { desc = "[LSP] 宣言へ移動" })
	key("n", "[DEV]i", b("implementation"), { desc = "[LSP] 実装へ移動" })
	key("n", "[DEV]t", b("type_definition"), { desc = "[LSP] 型定義へ移動" })
	key("n", "[DEV]n", b("rename"), { desc = "[LSP] シンボル名をリネーム" })
	key("n", "[DEV]s", b("signature_help"), { desc = "[LSP] シグネチャヘルプを表示" })
	key("n", "[DEV]wa", b("add_workspace_folder"), { desc = "[LSP] ワークスペースフォルダを追加" })
	key("n", "[DEV]wr", b("remove_workspace_folder"), { desc = "[LSP] ワークスペースフォルダを削除" })
	key("n", "[DEV]wl", function()
		print(v.inspect(b("list_workspace_folders")))
	end, { desc = "[LSP] ワークスペースフォルダ一覧を表示" })
	key({ "n", "v" }, "[dev]a", b("code_action"), { desc = "[LSP] コードアクションを適用" })
end

return M
