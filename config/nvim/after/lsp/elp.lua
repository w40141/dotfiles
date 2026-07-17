---@type vim.lsp.Config
return {
	-- ELP (Erlang Language Platform) の設定
	-- Erlangプロジェクトのルートディレクトリ判定基準
	root_markers = { "rebar.config", "erlang.mk", ".git" },
}
