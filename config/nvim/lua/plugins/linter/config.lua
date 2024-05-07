local M = {}

function M.lint()
	local v = vim
	local autocmd = v.api.nvim_create_autocmd
	local lint = require("lint")

	local linters = {
		bash = { "shellcheck" },
		dockerfile = {
			"hadolint",
		},
		go = {
			"golangcilint",
			"revive",
		},
		javascript = {
			"eslint_d",
		},
		lua = { "selene" },
		markdown = { "markdownlint" },
		python = {
			"ruff",
			"vulture",
		},
		sh = { "shellcheck" },
		sql = { "sqlfluff" },
		typescript = {
			"eslint_d",
		},
		yaml = { "yamllint" },
		zsh = { "shellcheck" },
	}

	local anyfile = {
		"codespell",
		"woke",
	}

	require("mason-nvim-lint").setup({
		ensure_installed = anyfile,
	})

	lint.linters_by_ft = linters

	autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
		callback = function()
			lint.try_lint()
			lint.try_lint(anyfile)
		end,
	})
end

return M
