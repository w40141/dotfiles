" Replace a specifide text with register content
" https://github.com/kana/vim-operator-replace

UsePlugin 'vim-operator-replace'

lua << EOF
vim.api.nvim_set_keymap('', '_', [[<plug>(operator-replace)]], { noremap = false, silent = true })
EOF
