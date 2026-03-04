local M = {}

function M.lint()
	local v = vim
	local autocmd = v.api.nvim_create_autocmd
	local lint = require("lint")

	local linters = {
		bash = { "shellcheck" },
		css = { "stylelint" },
		dockerfile = { "hadolint" },
		go = { "golangcilint" },
		javascript = { "biomejs" },
		json = { "jsonlint" },
		lua = { "selene" },
		markdown = { "markdownlint-cli2" },
		python = { "ruff" },
		sh = { "shellcheck" },
		sql = { "sqruff" },
		typescript = { "biomejs" },
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

	local grp = v.api.nvim_create_augroup("MyLint", { clear = true })

	autocmd({ "BufWritePost" }, {
		group = grp,
		callback = function()
			lint.try_lint()
			lint.try_lint(anyfile)
		end,
	})

	autocmd({ "InsertLeave" }, {
		group = grp,
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
