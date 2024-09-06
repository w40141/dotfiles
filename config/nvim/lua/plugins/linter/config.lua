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
		javascript = { "biome" },
		json = { "jsonlint", "biome" },
		lua = { "selene" },
		markdown = { "markdownlint-cli2" },
		python = { "ruff", "vulture" },
		sh = { "shellcheck" },
		sql = { "sqlfluff" },
		terraform = { "tflint" },
		typescript = { "biome" },
		yaml = { "yamllint" },
		zsh = { "shellcheck" },
	}

	local anyfile = {
		"codespell",
		"cspell",
		"woke",
	}

	lint.linters_by_ft = linters

	require("mason-nvim-lint").setup({
		ensure_installed = anyfile,
	})

	autocmd({ "BufRead", "BufWritePost" }, {
		callback = function()
			if v.tbl_contains({ "man", "vim", "help" }, v.bo.filetype) then
				return
			end
			require("lint").try_lint("cspell")
		end,
	})

	autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
		callback = function()
			lint.try_lint()
			lint.try_lint(anyfile)
		end,
	})
end

return M
