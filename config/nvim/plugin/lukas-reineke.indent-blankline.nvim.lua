-- Indent guides for Neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- UsePlugin 'indent-blankline.nvim'

-- lua << EOF
require('indent_blankline').setup{
    indent_blankline_use_treesitter = true,
    show_current_context = true,
    -- show_current_context_start = true,
}

vim.g.indent_blankline_filetype_exclude = {
    'help', 'mini', 'starter', 'terminal'
}
-- EOF
