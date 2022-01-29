local g = vim.g
local cmd = vim.cmd

cmd('augroup MyAutoCmd')
cmd('autocmd!')
cmd('augroup END')

-- 不要なデフォルトプラグイン
g.do_filetype_lua = 1
g.did_load_filetypes = 0
g.did_indent_on             = 1
g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.loaded_2html_plugin       = 1
g.loaded_gzip               = 1
g.loaded_getscript          = 1
g.loaded_getscriptPlugin    = 1
g.loaded_man                = 1
g.loaded_matchit            = 1
g.loaded_netrw              = 1
g.loaded_netrwFileHandlers  = 1
g.loaded_netrwPlugin        = 1
g.loaded_netrwSettings      = 1
g.loaded_rrhelper           = 1
g.loaded_shada_plugin       = 1
g.loaded_spellfile_plugin   = 1
g.loaded_tar                = 1
g.loaded_tarPlugin          = 1
g.loaded_tutor_mode_plugin  = 1
g.loaded_vimball            = 1
g.loaded_vimballPlugin      = 1
g.loaded_zip                = 1
g.loaded_zipPlugin          = 1
g.skip_loading_mswin        = 1

require('option')
require('keymap')
