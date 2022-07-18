local g = vim.g

g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.did_load_ftplugin         = 1

g.loaded_2html_plugin       = 1
g.loaded_gzip               = 1 g.loaded_man                = 1
g.loaded_matchit            = 1
g.loaded_matchparen         = 1
g.loaded_netrwPlugin        = 1
g.loaded_remote_plugins     = 1
g.loaded_shada_plugin       = 1
g.loaded_spellfile_plugin   = 1
g.loaded_tarPlugin          = 1
g.loaded_tutor_mode_plugin  = 1
g.loaded_zipPlugin          = 1
g.skip_loading_mswin        = 1

g.loaded_perl_provider      = 0

-- g.loaded_node_provider      = 0
-- g.loaded_python3_provider   = 0
-- g.loaded_python_provider    = 0
-- g.loaded_pythonx_provider   = 0
-- g.loaded_ruby_provider      = 0


-- g.config_dir = vim.fn.empty($XDG_CONFIG_HOME) ? vim.fn.expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
-- g.python3_host_prog = g.config_dir . "/nvim/neovim3/.venv/bin/python"
-- g.node_host_prog = vim.fn.expand($HOME) . "/.asdf/installs/nodejs/16.9.1/.npm/bin/neovim-node-host"
vim.api.nvim_set_var("python3_host_prog", "$HOME/.config/nvim/python3/.venv/bin/python")

require('option')
require('keymap')
require('plugin')
