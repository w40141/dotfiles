local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key('n', '<leader>m', '<plug>(quickhl-manual-this)', opts)
key('x', '<leader>m', '<plug>(quickhl-manual-this)', opts)
key('n', '<leader>M', '<plug>(quickhl-manual-reset)', opts)
key('x', '<leader>M', '<plug>(quickhl-manual-reset)', opts)
