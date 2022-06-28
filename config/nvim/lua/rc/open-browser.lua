-- Open url with a browser
-- https://github.com/tyru/open-browser.vim

vim.g.netrw_nogx = 1
local key = vim.api.nvim_set_keymap
key('n', 'gx', [[<plug>(openbrowser-smart-search)]], { noremap = false, silent = true })
key('v', 'gx', [[<plug>(openbrowser-smart-search)]], { noremap = false, silent = true })
