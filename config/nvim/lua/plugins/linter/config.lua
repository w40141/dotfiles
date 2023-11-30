local M = {}

function M.nvim_lint()
	local v = vim
	local autocmd = v.api.nvim_create_autocmd
	local lint = require("lint")

	local linters = {
		bash = { "shellcheck" },
		dockerfile = {
			"hadolint",
			-- "trivy",
		},
		go = {
			"golangcilint",
			"revive",
			-- "trivy",
		},
		-- java = { "checkstyle" },
		javascript = {
			"eslint_d",
			-- "trivy",
		},
		lua = { "selene" },
		markdown = { "markdownlint" },
		python = {
			"ruff",
			"vulture",
			-- "trivy",
		},
		sh = { "shellcheck" },
		sql = { "sqlfluff" },
		typescript = {
			"eslint_d",
			-- "trivy",
		},
		yaml = { "yamllint", "actionlint" },
		zsh = { "shellcheck" },
	}

	local anyfile = {
		"codespell",
		"woke",
		"trivy",
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
