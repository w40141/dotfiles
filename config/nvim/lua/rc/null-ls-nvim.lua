local null_ls = require("null-ls")
local builtins = require("null-ls.builtins")

null_ls.setup({
    sources = {
    -- LuaFormatter off
    -- null_ls.builtins.completion.spell,
    builtins.formatting.trim_whitespace,
    builtins.formatting.stylua.with({
        condition = function()
            return vim.fn.executable("stylua") > 0
        end,
    }),
    builtins.formatting.black.with({
        condition = function()
            return vim.fn.executable("black") > 0
        end,
    }),
    -- rust-analyzer
    builtins.formatting.rustfmt,
    builtins.formatting.prettier.with({
        condition = function()
            return vim.fn.executable("prettier") > 0
        end,
    }),
    builtins.diagnostics.eslint.with({
        condition = function()
            return vim.fn.executable("eslint") > 0
        end,
    }),
    builtins.formatting.shfmt.with({
        condition = function()
            return vim.fn.executable("shfmt") > 0
        end,
    }),
    builtins.diagnostics.shellcheck.with({
        condition = function()
            return vim.fn.executable("shellcheck") > 0
        end,
    }),
    builtins.diagnostics.editorconfig_checker.with({
        condition = function()
            return vim.fn.executable("ec") > 0
        end,
    }),
    builtins.diagnostics.cspell.with({
        diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["WARN"]
        end,
        condition = function()
            return vim.fn.executable("cspell") > 0
        end,
    }),
    builtins.diagnostics.vale.with({
        diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["WARN"]
        end,
        condition = function()
            return vim.fn.executable("vale") > 0
        end,
    }),
    -- builtins.diagnostics.codespell.with({
    -- 	args = spell_args,
    -- }),
    -- create
    builtins.formatting.markdownlint.with({
        condition = function()
            return vim.fn.executable("markdownlint") > 0
        end,
    }),
    builtins.code_actions.gitsigns,
    -- LuaFormatter on
}

})
