" Select increasingly larger regions of text
" https://github.com/terryma/vim-expand-region

UsePlugin 'vim-expand-region'

lua << EOF
local key = vim.api.nvim_set_keymap
key('v', 'K', [[<plug>(expand_region_expand)]], { noremap = false, silent = true })
key('v', 'J', [[<plug>(expand_region_shrink)]], { noremap = false, silent = true })
EOF
