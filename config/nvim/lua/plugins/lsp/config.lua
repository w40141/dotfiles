local M = {}

function M.mason_tool_installer()
  local v = vim
  require("mason-tool-installer").setup({
    ensure_installed = {
      "bash-language-server",
      "black",
      "cspell",
      "deno",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "editorconfig-checker",
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

function M.lspconfig()
  local v = vim
  local lsp = v.lsp
  local api = v.api
  local hl = api.nvim_set_hl
  local buf = lsp.buf
  local augroup = api.nvim_create_augroup
  local autocmd = api.nvim_create_autocmd
  local nvim_lsp = require("lspconfig")

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
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

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  local handler = function(server_name)
    local node_root_dir = nvim_lsp.util.root_pattern("package.json")
    local is_node_repo = node_root_dir(api.nvim_buf_get_name(0)) ~= nil

    local opts = {}

    if server_name == "tsserver" then
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
    elseif server_name == "eslint" then
      if not is_node_repo then
        return
      end

      opts.root_dir = node_root_dir
    elseif server_name == "denols" then
      if is_node_repo then
        return
      end

      opts.root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
      opts.init_options = {
        lint = true,
        unstable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
              ["https://cdn.nest.land"] = true,
              ["https://crux.land"] = true,
            },
          },
        },
      }
    end

    if server_name == "gopls" then
      autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          local params = v.lsp.util.make_range_params()
          params.context = { only = { "source.organizeImports" } }
          local result = v.lsp.buf_request_sync(0, "textDocument/codeAction", params)
          for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                local enc = (v.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                v.lsp.util.apply_workspace_edit(r.edit, enc)
              end
            end
          end
          v.lsp.buf.format({ async = false })
        end,
      })
      opts.settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      }
    end

    if server_name == "golangci_lint_ls" then
      -- opts.filetypes = { "go", "gomod" }
      -- opts.cmd = { "golangci-lint-langserver" }
      -- opts.root_dir = nvim_lsp.util.root_pattern(".git", "go.mod")
      opts.init_options = {
        command = {
          "golangci-lint",
          "run",
          "--out-format",
          "json",
        },
      }
    end
    -- if server_name == "efm" then
    -- 	opts.settings = {
    -- 		init_options = { documentFormatting = true },
    -- 		settings = {
    -- 			rootMarkers = { ".git/" },
    -- 			languages = {
    -- 				lua = {
    -- 					{
    -- 						formatCommand = "stylua --color Never --config-path ~/.config/.stylua.toml -",
    -- 					},
    -- 					{
    -- 						lintCommand = "luacheck --no-color --quiet --config ~/.config/.luacheckrc -",
    -- 						lintFormats = { "%f:%l:%c: %m" },
    -- 					},
    -- 				},
    -- 			},
    -- 		},
    -- 		filetypes = {
    -- 			"lua",
    -- 		},
    -- 	}
    -- end

    opts.capabilities = capabilities
    opts.on_attach = on_attach
    opts.flag = lsp_flags

    nvim_lsp[server_name].setup(opts)
  end

  require("mason-lspconfig").setup_handlers({
    handler,
  })
end

return M
