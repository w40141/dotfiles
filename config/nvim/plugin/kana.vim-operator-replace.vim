" Replace a specifide text with register content
" https://github.com/kana/vim-operator-replace

UsePlugin 'vim-operator-replace'

lua << EOF
local key = vim.api.nvim_set_keymap
key('', '_', [[<plug>(operator-replace)]], { noremap = false, silent = true })
EOF
