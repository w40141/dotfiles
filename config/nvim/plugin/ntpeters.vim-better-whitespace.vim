" Better whitespace highlighting for Vim
" https://github.com/ntpeters/vim-better-whitespace

UsePlugin 'ntpeters/vim-better-whitespace'

lua << EOF
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.current_line_whitespace_disabled_soft = 1
vim.g.better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']
local key = vim.api.nvim_set_keymap
key('n', ',s', [[:StripWhitespace<cr>]], { noremap = true, silent = false })
-- key('n', '[w', ':NextTrailingWhitespace<CR>', { noremap = true, silent = false })
-- key('n', ']w', ':PrevTrailingWhitespace<CR>', { noremap = true, silent = false })
EOF
