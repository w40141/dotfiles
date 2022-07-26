local key = vim.keymap.set
local ff = { noremap = false, silent = false }
key('n', 'qh', "<plug>BDeletePre", ff)
key('n', 'ql', "<plug>BDeletePost", ff)
