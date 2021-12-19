" Target a rectangular area
" https://github.com/osyo-manga/vim-textobj-multiblock

UsePlugin 'vim-textobj-multiblock'

lua << EOF
vim.api.nvim_set_keymap('o', 'ab', [[<Plug>(textobj-multiblock-a)]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('o', 'ib', [[<Plug>(textobj-multiblock-i)]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'ab', [[<Plug>(textobj-multiblock-a)]], { noremap = false, silent = true })
vim.api.nvim_set_keymap('v', 'ib', [[<Plug>(textobj-multiblock-i)]], { noremap = false, silent = true })
EOF
