local M = {}

function M.conform()
	local v = vim
	local conform = require("conform")

	conform.setup({
		-- formatters = {
		-- 	google_java_format = { args = { "-", "-aosp" } },
		-- },
		formatters_by_ft = {
			bash = { "shfmt" },
			elixir = { "mix" },
			fish = { "fish_indent" },
			go = { "gofumpt", "gofmt", "goimports", "golines" },
			-- java = { "google-java-format" },
			javascript = { "prettier" },
			json = { "fixjson" },
			lua = { "stylua" },
			markdown = { "markdownlint" },
			python = { "black" },
			sh = { "shfmt" },
			sql = { "sql_formatter" },
			yaml = { "yamlfmt" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		format_after_save = {
			lsp_fallback = true,
		},
		log_level = v.log.levels.ERROR,
		notify_on_error = true,
	})
end

return M
