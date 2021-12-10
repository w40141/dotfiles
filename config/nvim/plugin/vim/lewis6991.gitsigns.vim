" Git integration for buffers
" https://github.com/lewis6991/gitsigns.nvim

UsePlugin 'lewis6991/gitsigns.nvim'

lua << EOF
require('nvim-treesitter.configs').setup()
EOF
