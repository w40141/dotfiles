-- Indent guides for Neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- vim.cmd([[UsePlugin 'indent-blankline.nvim']])

require('indent_blankline').setup{
    indent_blankline_use_treesitter = true,
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
}

-- let g:indent_blankline_filetype_exclude = ['alpha']
vim.g.indent_blankline_filetype_exclude = {
    'help', 'mini', 'starter'
}
