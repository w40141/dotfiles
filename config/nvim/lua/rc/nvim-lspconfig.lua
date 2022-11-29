local fn = vim.fn;
local key = vim.keymap.set;
local diagnostic = vim.diagnostic
local buf = vim.lsp.buf
local opts = { noremap = true, silent = true }

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

key('n', '[dev]o', diagnostic.open_float, opts)
key('n', ']g', diagnostic.goto_next, opts)
key('n', '[g', diagnostic.goto_prev, opts)
key('n', '[dev]q', diagnostic.setloclist, opts)

key('n', 'H', buf.hover)
key('n', '[dev]f', buf.format)
key('n', '[dev]r', buf.references)
key('n', '[dev]d', buf.definition)
key('n', '[dev]D', buf.declaration)
key('n', '[dev]i', buf.implementation)
key('n', '[dev]t', buf.type_definition)
key('n', '[dev]n', buf.rename)
key('n', '[dev]a', buf.code_action)
key('n', '[dev]s', buf.signature_help)
key('n', '[dev]wa', buf.add_workspace_folder)
key('n', '[dev]wr', buf.remove_workspace_folder)
key('n', '[dev]wl', function()
  print(vim.inspect(buf.list_workspace_folders()))
end, bufopts)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
  virtual_text = {
    format = function(diagnostic)
      return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
    end,
  },
})

vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]
