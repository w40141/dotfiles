local M = {}

function M.lint()
	local v = vim
	local autocmd = v.api.nvim_create_autocmd
	local lint = require("lint")

	local linters = {
		bash = { "shellcheck" },
		css = { "stylelint" },
		dockerfile = { "hadolint" },
		go = { "golangcilint", "revive" },
		-- javascript = { "biomejs" },
		json = { "jsonlint" },
		lua = { "selene" },
		markdown = { "markdownlint" },
		-- python = { "ruff", "vulture" },
		python = { "ruff" },
		sh = { "shellcheck" },
		sql = { "sqlfluff" },
		-- typescript = { "biomejs" },
		yaml = { "yamllint" },
		zsh = { "shellcheck" },
	}

	local anyfile = {
		"codespell",
		-- "cspell",
		"typos",
		"woke",
	}

	lint.linters_by_ft = linters

	-- require("mason-nvim-lint").setup({
	-- 	ensure_installed = anyfile,
	-- 	automatic_installation = true,
	-- 	quiet_mode = false,
	-- 	ignore_install = {},
	-- })

	autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
		callback = function()
			lint.try_lint()
			lint.try_lint(anyfile)
		end,
	})
end

return M
