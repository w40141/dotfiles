" Cheatsheet for neovim's config
" https://github.com/reireias/vim-cheatsheet

UsePlugin 'vim-cheatsheet'

let g:cheatsheet#cheat_file = g:config_dir . "/nvim/plugins/util/cheatsheet.md"
lua << EOF
vim.api.nvim_set_keymap('n', ',c', [[:Cheat]], { noremap = true, silent = true })
EOF
