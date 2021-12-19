vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype off')
vim.cmd('syntax off')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require('option')
require('keymap')
require('plugin')
