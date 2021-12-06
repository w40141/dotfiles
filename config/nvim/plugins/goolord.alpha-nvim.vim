" a lua powered greeter like vim-startify / dashboard-nvim
" https://github.com/goolord/alpha-nvim

UsePlugin 'goolord/alpha-nvim'

lua << EOF
require('alpha').setup(require('alpha.themes.startify').opts)
EOF
