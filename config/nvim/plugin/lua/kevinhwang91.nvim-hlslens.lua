-- Hlsearch Lens for Neovim
-- https://github.com/kevinhwang91/nvim-hlslens

require('hlslens').setup({
    -- calm_down = true,
    -- nearest_only = true,
    -- nearest_float_when = 'always'
})

local api = vim.api

-- noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
api.nvim_set_keymap('', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
 -- noremap * *<Cmd>lua require('hlslens').start()<CR>
api.nvim_set_keymap('', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap # #<Cmd>lua require('hlslens').start()<CR>
api.nvim_set_keymap('', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap g* g*<Cmd>lua require('hlslens').start()<CR>
api.nvim_set_keymap('', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap g# g#<Cmd>lua require('hlslens').start()<CR>
api.nvim_set_keymap('', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })

-- use : instead of <Cmd>
-- noremap <silent><C-c> :<C-u>nohlsearch<CR>
api.nvim_set_keymap('', '<c-c>', [[:<c-u>nohlsearch<cr>]], { noremap = true, silent = true })
