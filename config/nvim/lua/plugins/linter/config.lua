local M = {}

function M.nvim_lint()
	local v = vim
	local autocmd = v.api.nvim_create_autocmd
	local lint = require("lint")

	local linters = {
		bash = { "shellcheck" },
		docker = { "hadolint" },
		go = { "golangcilint" },
		-- java = { "checkstyle" },
		javascript = { "eslint_d" },
		lua = { "selene" },
		python = { "ruff", "vulture" },
		sh = { "shellcheck" },
		sql = { "sqlfluff" },
		typescript = { "eslint_d" },
		yaml = { "yamllint", "actionlint" },
		zsh = { "shellcheck" },
	}

	require("mason-nvim-lint").setup()

	lint.linters_by_ft = linters

	autocmd({ "BufWritePost" }, {
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
