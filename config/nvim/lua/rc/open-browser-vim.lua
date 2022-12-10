local v = vim
v.g.netrw_nogx = 1
local key = v.keymap.set
key("n", "gx", "<plug>(openbrowser-smart-search)")
key("v", "gx", "<plug>(openbrowser-smart-search)")
