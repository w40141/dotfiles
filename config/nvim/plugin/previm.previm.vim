" Realtime preview by Vim. (Markdown, reStructuredText, textile)
" https://github.com/previm/previm

UsePlugin 'previm'

let g:previm_open_cmd = 'open -a Google\ Chrome'
lua << EOF
local key = vim.api.nvim_set_keymap
vim.g.previm_enable_realtime = 1
key('n', ',o', [[:<c-u>PrevimOpen<cr>]], { noremap = true, silent = true })
EOF
