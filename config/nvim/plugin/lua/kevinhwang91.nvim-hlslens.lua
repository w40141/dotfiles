-- Hlsearch Lens for Neovim
-- https://github.com/kevinhwang91/nvim-hlslens

-- vim.cmd([[UsePlugin 'nvim-hlslens']])

local api = vim.api
api.nvim_set_keymap('', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
-- noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
--             \<Cmd>lua require('hlslens').start()<CR>
-- " noremap * *<Cmd>lua require('hlslens').start()<CR>
-- noremap # #<Cmd>lua require('hlslens').start()<CR>
-- noremap g* g*<Cmd>lua require('hlslens').start()<CR>
-- noremap g# g#<Cmd>lua require('hlslens').start()<CR>
-- 
-- " use : instead of <Cmd>
-- noremap <silent><C-c> :<C-u>nohlsearch<CR>
-- 
