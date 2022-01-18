-- Hlsearch Lens for Neovim
-- https://github.com/kevinhwang91/nvim-hlslens

-- UsePlugin 'nvim-hlslens'

-- lua << EOF
require('hlslens').setup({
    -- calm_down = true,
    -- nearest_only = true,
    -- nearest_float_when = 'always'
})

local key = vim.api.nvim_set_keymap

-- noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
key('', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
 -- noremap * *<Cmd>lua require('hlslens').start()<CR>
key('', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap # #<Cmd>lua require('hlslens').start()<CR>
key('', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap g* g*<Cmd>lua require('hlslens').start()<CR>
key('', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap g# g#<Cmd>lua require('hlslens').start()<CR>
key('', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })

-- use : instead of <Cmd>
-- noremap <silent><C-c> :<C-u>nohlsearch<CR>
key('', '<c-c>', [[:<c-u>nohlsearch<cr>]], { noremap = true, silent = true })

-- EOF
