local M = {}

function M.conform()
	local v = vim
	local conform = require("conform")

	-- local slow_format_filetypes = {}
	conform.setup({
		formatters_by_ft = {
			bash = { "shfmt" },
			elixir = { "mix" },
			fish = { "fish_indent" },
			-- go = { "gofumpt", "goimports", "golines", "gofmt" },
			go = { "gofumpt", "goimports", "golines" },
			javascript = { "prettier" },
			json = { "fixjson" },
			lua = { "stylua" },
			markdown = { "markdownlint", "markdown-toc", "prettier" },
			python = { "black" },
			sh = { "shfmt" },
			sql = { "sql_formatter" },
			yaml = { "yamlfmt" },
			xml = { "xmlformat" },
			terraform = { "terraform_fmt" },
			["*"] = {
				"codespell",
			},
			["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" },
		},
		log_level = v.log.levels.ERROR,
		notify_on_error = true,
	})
end

return M
