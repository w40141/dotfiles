---@type vim.lsp.Config
return {
	cmd = { "elixir-ls" },
	-- プロジェクトのルートディレクトリ判定（mix.exs を基準にする）
	root_markers = { "mix.exs", ".git" },
	settings = {
		elixirLS = {
			-- 補完や静的解析のための基本設定
			dialyzerEnabled = true,
			fetchDeps = false, -- エディタを開くたびに依存関係を取得して重くなるのを防ぐ
			enableTestLenses = true,
			suggestSpecs = true,
		},
	},
}
