local v = vim
local api = v.api
local augroup = api.nvim_create_augroup -- Create/get autocommand group
local autocmd = api.nvim_create_autocmd -- Create autocommand
local hl = api.nvim_set_hl
local lsp = v.lsp
local buf = lsp.buf

local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
  local cap = client.server_capabilities.document_highlight
  if cap then
    hl(0, "LspReferenceText", { underline = true, bold = true, fg = "#A00000", bg = "#104040" })
    hl(0, "LspReferenceRead", { underline = true, bold = true, fg = "#A00000", bg = "#104040" })
    hl(0, "LspReferenceWrite", { underline = true, bold = true, fg = "#A00000", bg = "#104040" })
    local ldh = augroup("LspDocumentHighlight", {})
    autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = buf.document_highlight,
      group = ldh,
    })
    autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = bufnr,
      callback = buf.clear_references,
      group = ldh,
    })
  end
end

require("mason-lspconfig").setup_handlers({
  function(server)
    local opts = { capabilities = capabilities, on_attach = on_attach }
    require("lspconfig")[server].setup(opts)
  end,
})

require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer" },
})
