" Cheatsheet for neovim's config
" https://github.com/reireias/vim-cheatsheet

" UsePlugin 'vim-cheatsheet'

let g:cheatsheet#cheat_file = g:config_dir . "/nvim/plugins/util/cheatsheet.md"
lua << EOF
local key = vim.api.nvim_set_keymap
key('n', ',c', [[:Cheat]], { noremap = true, silent = true })
EOF
