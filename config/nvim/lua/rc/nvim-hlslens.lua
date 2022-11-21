require('hlslens').setup({
  -- calm_down = true,
  -- nearest_only = true,
  -- nearest_float_when = 'always'
})

-- local key = vim.api.nvim_set_keymap

local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key('', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>", opts)
key('', '*', "*<Cmd>lua require('hlslens').start()<CR>", opts)
key('', '#', "#<Cmd>lua require('hlslens').start()<CR>", opts)
key('', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", opts)
key('', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", opts)
key('', '<c-c>', "<Cmd>nohlsearch<cr>", opts)
