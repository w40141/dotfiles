local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key('n', ',m', '<plug>(quickhl-manual-this)', opts)
key('x', ',m', '<plug>(quickhl-manual-this)', opts)
key('n', ',M', '<plug>(quickhl-manual-reset)', opts)
key('x', ',M', '<plug>(quickhl-manual-reset)', opts)
