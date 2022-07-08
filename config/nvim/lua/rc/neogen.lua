local neogen = require('neogen')

neogen.setup {
    snippet_engine = "snippy",
    enabled = true, --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
}
local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key("i", "<C-l>", neogen.jump_next, opts)
key("i", "<C-h>", neogen.jump_prev, opts)
