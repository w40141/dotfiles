local g = vim.g
g.previm_open_cmd = [[open -a Google\ Chrome]]
g.previm_enable_realtime = 1
vim.keymap.set("n", ",o", "<Cmd>PrevimOpen<cr>")
