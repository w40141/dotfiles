" Open url with a browser
" https://github.com/tyru/open-browser.vim

UsePlugin 'open-browser.vim'

lua << EOF
vim.g.netrw_nogx = 1
vim.api.nvim_set_keymap('n', 'gx', [[<plug>(openbrowser-smart-search)]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'gx', [[<plug>(openbrowser-smart-search)]], { noremap = false, silent = true })
EOF
