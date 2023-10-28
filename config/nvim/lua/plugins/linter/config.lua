local M = {}

function M.nvim_lint()
	local v = vim
	local api = v.api
	local lint = require("lint")

	local linters = {
		bash = { "shellcheck" },
		docker = { "hadolint" },
		go = { "golangcilint" },
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

	-- ✓ typos (keywords: )
	lint.linters_by_ft = linters

	api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
