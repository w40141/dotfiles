vim.g.netrw_nogx = 1
local key = vim.keymap.set
key('n', 'gx', "<plug>(openbrowser-smart-search)", { noremap = false, silent = true })
key('v', 'gx', "<plug>(openbrowser-smart-search)", { noremap = false, silent = true })
