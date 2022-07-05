local key = vim.api.nvim_set_keymap
key('n', '<leader>m', '<plug>(quickhl-manual-this)', { noremap = false, silent = true })
key('x', '<leader>m', '<plug>(quickhl-manual-this)', { noremap = false, silent = true })
key('n', '<leader>M', '<plug>(quickhl-manual-reset)', { noremap = false, silent = true })
key('x', '<leader>M', '<plug>(quickhl-manual-reset)', { noremap = false, silent = true })
