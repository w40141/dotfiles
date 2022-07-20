local key = vim.keymap.set
local ff = { noremap = false, silent = false }
key('', 'K', "<plug>(expand_region_expand)", ff)
key('', 'J', "<plug>(expand_region_shrink)", ff)
