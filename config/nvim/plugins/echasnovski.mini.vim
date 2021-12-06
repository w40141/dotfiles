" Neovim plugin with collection of minimal, independent,
" and fast Lua modules dedicated to improve Neovim (version 0.5 and higher)
" experienceAutomatic table creator & formatter
" https://github.com/echasnovski/mini.nvim
"

UsePlugin 'mini.nvim'

lua << EOF
require('mini.tabline').setup()
require('mini.starter').setup()
EOF