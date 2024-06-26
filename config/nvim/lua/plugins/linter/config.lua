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
			-- "eslint_d",
			"biomejs"
		},
		json = {
			"jsonlint",
			"biomejs"
		},
		lua = { "selene" },
		markdown = { "markdownlint-cli2" },
		python = {
			"ruff",
			"vulture",
		},
		sh = { "shellcheck" },
		sql = { "sqlfluff" },
		typescript = {
			-- "eslint_d",
			"biomejs"
		},
		yaml = { "yamllint" },
		zsh = { "shellcheck" },
		terraform = { "tflint" },
	}

	local anyfile = {
		"codespell",
		"woke",
	}

	lint.linters_by_ft = linters

	require("mason-nvim-lint").setup({
		ensure_installed = anyfile,
	})

	autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
		callback = function()
			lint.try_lint()
			lint.try_lint(anyfile)
		end,
	})
end

return M
