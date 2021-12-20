" Realtime preview by Vim. (Markdown, reStructuredText, textile)
" https://github.com/previm/previm

UsePlugin 'previm'

let g:previm_open_cmd = 'open -a Google\ Chrome'
lua << EOF
vim.g.previm_enable_realtime = 1
vim.api.nvim_set_keymap('n', ',o', [[:<c-u>PrevimOpen<cr>]], { noremap = true, silent = true })
EOF
