local null_ls = require("null-ls")
local builtins = require("null-ls.builtins")
local exe = vim.fn.executable
local d = vim.diagnostic.severity

null_ls.setup({
  sources = {
    -- LuaFormatter off
    -- null_ls.builtins.completion.spell,
    builtins.formatting.trim_whitespace,
    builtins.formatting.stylua.with({
      condition = function()
        return exe("stylua") > 0
      end,
    }),
    builtins.formatting.black.with({
      condition = function()
        return exe("black") > 0
      end,
    }),
    -- rust-analyzer
    builtins.formatting.rustfmt,
    builtins.formatting.prettier.with({
      condition = function()
        return exe("prettier") > 0
      end,
    }),
    builtins.diagnostics.eslint.with({
      condition = function()
        return exe("eslint") > 0
      end,
    }),
    builtins.formatting.shfmt.with({
      condition = function()
        return exe("shfmt") > 0
      end,
    }),
    builtins.diagnostics.shellcheck.with({
      condition = function()
        return exe("shellcheck") > 0
      end,
    }),
    builtins.diagnostics.editorconfig_checker.with({
      condition = function()
        return exe("ec") > 0
      end,
    }),
    builtins.diagnostics.cspell.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = d["WARN"]
      end,
      condition = function()
        return exe("cspell") > 0
      end,
    }),
    builtins.diagnostics.vale.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = d["WARN"]
      end,
      condition = function()
        return exe("vale") > 0
      end,
    }),
    -- builtins.diagnostics.codespell.with({
    -- 	args = spell_args,
    -- }),
    -- create
    builtins.formatting.markdownlint.with({
      condition = function()
        return exe("markdownlint") > 0
      end,
    }),
    builtins.code_actions.gitsigns,
    -- LuaFormatter on
  }

})
