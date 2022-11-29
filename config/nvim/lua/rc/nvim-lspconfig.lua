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
