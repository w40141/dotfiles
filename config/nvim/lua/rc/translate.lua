local g = vim.g
local key = vim.api.nvim_set_keymap
g.translate_source = "en"
g.translate_target = "ja"
g.translate_popup_window = 1
g.translate_winsize = 10
key('n', ',t', [[<plug>(Translate)]], { noremap = false, silent = true })
key('v', ',t', [[<plug>(VTranslate)]], { noremap = false, silent = true })
