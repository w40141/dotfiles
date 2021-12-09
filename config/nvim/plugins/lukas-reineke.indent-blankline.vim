" Indent guides for Neovim
" https://github.com/lukas-reineke/indent-blankline.nvim

UsePlugin 'lukas-reineke/indent-blankline.nvim'

lua << EOF
require('indent-blankline.nvim').setup{
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context_start = true,
}
EOF
