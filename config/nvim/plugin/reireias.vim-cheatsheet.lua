-- Cheatsheet for neovim's config
-- https://github.com/reireias/vim-cheatsheet

vim.g["cheatsheet#cheat_file"] = vim.g["config_dir"] .. "/nvim/plugins/util/cheatsheet.md"
local key = vim.api.nvim_set_keymap
key('n', ',c', [[:Cheat]], { noremap = true, silent = true })
