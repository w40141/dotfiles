" Git integration for buffers
" https://github.com/lewis6991/gitsigns.nvim

UsePlugin 'gitsigns.nvim'

lua << EOF
require('gitsigns').setup()
EOF
