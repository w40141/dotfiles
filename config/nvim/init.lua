local g = vim.g

g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.did_load_ftplugin         = 1

g.loaded_2html_plugin       = 1
g.loaded_gzip               = 1
g.loaded_man                = 1
g.loaded_matchit            = 1
g.loaded_matchparen         = 1
g.loaded_netrwPlugin        = 1
g.loaded_shada_plugin       = 1
g.loaded_spellfile_plugin   = 1
g.loaded_tarPlugin          = 1
g.loaded_tutor_mode_plugin  = 1
g.loaded_zipPlugin          = 1
g.skip_loading_mswin        = 1

g.loaded_perl_provider      = 0


vim.api.nvim_set_var("python3_host_prog", "$HOME/.config/nvim/python3/.venv/bin/python")

require('option')
require('keymap')
require('plugin')
