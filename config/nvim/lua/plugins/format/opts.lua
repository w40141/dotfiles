local M = {}

M.conform = {
	formatters_by_ft = {
		bash = { "shfmt" },
		css = { "prettier" },
		elixir = { "mix" },
		fish = { "fish_indent" },
		fsharp = { "fantomas" },
		go = { "gofumpt", "goimports", "golines" },
		hcl = { "hclfmt" },
		json = { "fixjson" },
		lua = { "stylua" },
		markdown = { "markdownlint-cli2" },
		python = { "ruff" },
		sh = { "shfmt" },
		sql = { "sqruff" },
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		astro = { "biome" },
		toml = { "taplo" },
		yaml = { "yamlfmt" },
		-- xml = { "xmlformat" },
		["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
	},
	formatters = {
		golines = {
			args = { "--max-len=100", "--tab-len=1", "--shorten-comments", "--reformat-tags" },
		},
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
}

return M
