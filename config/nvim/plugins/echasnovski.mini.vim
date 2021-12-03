" Neovim plugin with collection of minimal, independent,
" and fast Lua modules dedicated to improve Neovim (version 0.5 and higher)
" experienceAutomatic table creator & formatter
" https://github.com/echasnovski/mini.nvim
"

UsePlugin 'mini.nvim'

lua << EOF
require('mini.bufremove').setup()
require('mini.comment').setup()
require('mini.surround').setup()
require('mini.trailspace').setup()
require('mini.tabline').setup()
require('mini.starter').setup()
require('mini.misc').setup({
  make_global = { 'put', 'put_text', 'zoom' }
})
EOF
