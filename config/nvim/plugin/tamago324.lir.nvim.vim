" A simple file explorer
" https://github.com/tamago324/lir.nvim

UsePlugin 'lir.nvim'

lua << EOF
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
        ['l'] = actions.edit,
        ['s'] = actions.split,
        ['v'] = actions.vsplit,
        ['t'] = actions.tabedit,

        ['h'] = actions.up,
        ['q'] = actions.quit,

        ['k'] = actions.mkdir,
        ['n'] = actions.newfile,
        ['r'] = actions.rename,
        ['@'] = actions.cd,
        ['y'] = actions.yank_path,
        ['.'] = actions.toggle_show_hidden,
        ['d'] = actions.delete,
        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['c'] = clipboard_actions.copy,
        ['x'] = clipboard_actions.cut,
        ['p'] = clipboard_actions.paste,
    },
    float = {
        winblend = 0,
        curdir_window = {
            enable = false,
            highlight_dirname = false
        },

        -- -- You can define a function that returns a table to be passed as the third
        -- -- argument of nvim_open_win().
        -- win_opts = function()
        --   local width = math.floor(vim.o.columns * 0.8)
        --   local height = math.floor(vim.o.lines * 0.8)
        --   return {
        --     border = require("lir.float.helper").make_border_opts({
        --       "+", "─", "+", "│", "+", "─", "+", "│",
        --     }, "Normal"),
        --     width = width,
        --     height = height,
        --     row = 1,
        --     col = math.floor((vim.o.columns - width) / 2),
        --   }
        -- end,
    },
    hide_cursor = true,
}

-- use visual mode
function _G.LirSettings()
    vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<c-u>lua require"lir.mark.actions".toggle_mark("v")<cr>', {noremap = true, silent = true})

    -- echo cwd
    vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.api.nvim_set_keymap('n', '<c-e>', [[:lua require'lir.float'.toggle()<cr>]], { noremap = true, silent = false })
vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
EOF
