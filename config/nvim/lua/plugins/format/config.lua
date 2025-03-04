local M = {}

function M.conform()
	local v = vim
	local conform = require("conform")

	conform.setup({
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
			python = { "ruff_fix", "ruff_format" },
			sh = { "shfmt" },
			sql = { "sql_formatter" },
			typescript = { "biome" },
			toml = { "taplo" },
			yaml = { "yamlfmt" },
			-- xml = { "xmlformat" },
			["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
		},
		log_level = v.log.levels.ERROR,
		notify_on_error = true,
	})
	require("mason-conform").setup()
end

return M
