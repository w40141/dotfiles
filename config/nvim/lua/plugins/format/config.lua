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
			go = { "gofumpt", "goimports", "golines" },
			-- javascript = { "prettier" },
			javascript = { "biome" },
			json = { "biome", "fixjson" },
			-- json = { "fixjson" },
			lua = { "stylua" },
			markdown = { "markdownlint-cli2", "markdown-toc", "prettier" },
			python = { "black" },
			sh = { "shfmt" },
			sql = { "sql_formatter" },
			terraform = { "terraform_fmt" },
			typescript = { "biome" },
			toml = { "taplo" },
			yaml = { "yamlfmt" },
			xml = { "xmlformat" },
			-- ["*"] = {
			-- 	"codespell",
			-- },
			["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
		},
		log_level = v.log.levels.ERROR,
		notify_on_error = true,
	})
	require("mason-conform").setup()
end

return M
