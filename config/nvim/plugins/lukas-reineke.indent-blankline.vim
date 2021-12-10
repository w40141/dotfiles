" Indent guides for Neovim
" https://github.com/lukas-reineke/indent-blankline.nvim

UsePlugin 'lukas-reineke/indent-blankline.nvim'

lua << EOF
require('indent-blankline.nvim').setup{
    indent_blankline_use_treesitter = true,
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
}
EOF
