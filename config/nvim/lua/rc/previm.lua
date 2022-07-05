local g = vim.g
local key = vim.api.nvim_set_keymap
g.previm_open_cmd = [[open -a Google\ Chrome]]
g.previm_enable_realtime = 1
key('n', ',o', [[:<c-u>PrevimOpen<cr>]], { noremap = true, silent = true })
