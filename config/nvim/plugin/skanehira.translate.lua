-- Translate Language
-- https://github.com/skanehira/translate.vim

-- UsePlugin 'translate.vim'

-- lua << EOF
vim.g.translate_source = "en"
vim.g.translate_target = "ja"
vim.g.translate_popup_window = 1
vim.g.translate_winsize = 10
local key = vim.api.nvim_set_keymap
key('n', ',t', [[<plug>(Translate)]], { noremap = false, silent = true })
key('v', ',t', [[<plug>(VTranslate)]], { noremap = false, silent = true })
-- EOF
