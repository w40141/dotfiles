local M = {}

function M.mason_tool_installer()
  local v = vim
  require("mason-tool-installer").setup({
    ensure_installed = {
      -- LSP
      "bash-language-server",
      -- "black",
      "cspell",
      -- LSP
      "deno",
      -- LSP
      "docker-compose-language-service",
      -- LSP
      "dockerfile-language-server",
      "editorconfig-checker",
      -- LSP
      "efm",
      -- LSP
      "eslint-lsp",
      "fixjson",
      "gofumpt",
      "golangci-lint",
      "gopls",
      "graphql-language-service-cli",
      "hadolint",
      "html-lsp",
      "jdtls",
      "kotlin-language-server",
      "latexindent",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "prettier",
      "prisma-language-server",
      "pyright",
      "ruff",
      "rust-analyzer",
      "shfmt",
      "sql-formatter",
      "sqlls",
      "stylua",
      "texlab",
      "textlint",
      "typescript-language-server",
      "vale",
      "yamlfmt",
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 3000,
  })

  local m = v.api.nvim_create_augroup("Mason", {})
  v.api.nvim_create_autocmd("User", {
    pattern = "MasonToolsUpdateCompleted",
    callback = function()
      v.schedule(function()
        print("mason-tool-installer has finished")
      end)
    end,
    group = m,
  })
end

function M.mason()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

return M
