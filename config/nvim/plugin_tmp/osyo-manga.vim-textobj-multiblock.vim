" Target a rectangular area
" https://github.com/osyo-manga/vim-textobj-multiblock

UsePlugin 'vim-textobj-multiblock'

lua << EOF
local key = vim.api.nvim_set_keymap
key('o', 'ab', [[<Plug>(textobj-multiblock-a)]], { noremap = false, silent = true })
key('o', 'ib', [[<Plug>(textobj-multiblock-i)]], { noremap = false, silent = true })
key('v', 'ab', [[<Plug>(textobj-multiblock-a)]], { noremap = false, silent = true })
key('v', 'ib', [[<Plug>(textobj-multiblock-i)]], { noremap = false, silent = true })
EOF
