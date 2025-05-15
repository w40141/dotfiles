local M = {}

M.conform = {
	formatters_by_ft = {
		bash = { "shfmt" },
		css = { "prettier" },
		elixir = { "mix" },
		fish = { "fish_indent" },
		fsharp = { "fantomas" },
		go = { "gofumpt", "goimports", "golines" },
		-- hcl = { "hclfmt" },
		javascript = { "biome" },
		json = { "fixjson" },
		lua = { "stylua" },
		markdown = { "markdownlint-cli2", "markdown-toc", "prettier" },
		-- python = { "ruff_fix", "ruff_format" },
		python = { "ruff" },
		sh = { "shfmt" },
		sql = { "sql_formatter" },
		typescript = { "biome" },
		toml = { "taplo" },
		yaml = { "yamlfmt" },
		-- xml = { "xmlformat" },
		["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
}

return M
