local actions = require('lir.actions')
local mark_actions = require('lir.mark.actions')
local clipboard_actions = require('lir.clipboard.actions')

require('lir').setup {
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

local opts = { noremap = true, silent = true }
-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J', [[:<c-u>lua require"lir.mark.actions".toggle_mark("v")<cr>]], opts)
    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand('%:p'), 'Normal' } }, false, {})
end

vim.keymap.set('n', '<leader>e', require('lir.float').toggle, opts)
vim.cmd [[
augroup lir-settings
    autocmd!
    autocmd Filetype lir :lua LirSettings()
augroup END]]
