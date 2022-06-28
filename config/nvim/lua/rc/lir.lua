-- A simple file explorer
-- https://github.com/tamago324/lir.nvim

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
    show_hidden_files = true,
    devicons_enable = true,
    mappings = {
        ['l'] = actions.edit,
        ['<cr>'] = actions.edit,
        ['<c-s>'] = actions.split,
        ['<c-v>'] = actions.vsplit,
        ['<c-t>'] = actions.tabedit,

        ['h'] = actions.up,
        ['q'] = actions.quit,

        ['K'] = actions.mkdir,
        ['N'] = actions.newfile,
        ['R'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['.'] = actions.toggle_show_hidden,
        ['D'] = actions.delete,
        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,
    },
    float = {
        winblend = 0,
        curdir_window = {
            enable = false,
            highlight_dirname = false
        },
    },
    hide_cursor = true,
}

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J', [[:<c-u>lua require"lir.mark.actions".toggle_mark("v")<cr>]], {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.api.nvim_set_keymap('n', '<leader>e', [[:lua require'lir.float'.toggle()<cr>]], { noremap = true, silent = false })
vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
