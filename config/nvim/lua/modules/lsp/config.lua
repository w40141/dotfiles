local M = {}

function M.mason_tool_installer()
  local v = vim
  require("mason-tool-installer").setup({
    ensure_installed = {
      "bash-language-server",
      "black",
      "cspell",
      "dockerfile-language-server",
      "editorconfig-checker",
      "eslint-lsp",
      "fixjson",
      "graphql-language-service-cli",
      "html-lsp",
      "jdtls",
      "kotlin-language-server",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "prettier",
      "pyright",
      "ruff",
      "rust-analyzer",
      "rustfmt",
      "shfmt",
      "sql-formatter",
      "sqlls",
      "stylua",
      "textlint",
      "typescript-language-server",
      "vale",
      "yaml-language-server",
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

function M.lspconfig()
  local v = vim
  local lsp = v.lsp
  local api = v.api
  local hl = api.nvim_set_hl
  local buf = lsp.buf
  local augroup = api.nvim_create_augroup
  local autocmd = api.nvim_create_autocmd

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local sign = "DiagnosticSign" .. type
    v.fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
  end

  -- https://dev.classmethod.jp/articles/eetann-change-neovim-lsp-diagnostics-format/
  lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
    virtual_text = {
      format = function(diagnostic)
        return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
      end,
    },
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities())
  local on_attach = function(client, bufnr)
    api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.server_capabilities.documentHighlightProvider then
      hl(0, "LspReferenceText", {
        underline = true,
        bold = true,
        fg = "#A00000",
        bg = "#104040",
      })
      hl(0, "LspReferenceRead", {
        underline = true,
        bold = true,
        fg = "#A00000",
        bg = "#104040",
      })
      hl(0, "LspReferenceWrite", {
        underline = true,
        bold = true,
        fg = "#A00000",
        bg = "#104040",
      })
      local ldh = augroup("LspDocumentHighlight", {})
      autocmd({ "CursorHold", "CursorHoldI" }, { buffer = bufnr, callback = buf.document_highlight, group = ldh })
      autocmd({ "CursorMoved", "CursorMovedI" }, { buffer = bufnr, callback = buf.clear_references, group = ldh })
    end
  end

  local handler = function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end

  require("mason-lspconfig").setup()
  require("mason-lspconfig").setup_handlers({
    handler,
  })
end

return M
