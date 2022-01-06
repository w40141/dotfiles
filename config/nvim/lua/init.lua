vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

require('option')
require('keymap')

-- vim.cmd('filetype off')
-- vim.cmd('syntax off')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
