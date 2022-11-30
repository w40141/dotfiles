local g = vim.g

g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.do_filetype_lua           = 1
-- g.did_load_ftplugin         = 0

g.loaded_gzip              = 1
g.loaded_tar               = 1
g.loaded_tarPlugin         = 1
g.loaded_zip               = 1
g.loaded_zipPlugin         = 1
g.loaded_rrhelper          = 1
g.loaded_2html_plugin      = 1
g.loaded_vimball           = 1
g.loaded_vimballPlugin     = 1
g.loaded_getscript         = 1
g.loaded_getscriptPlugin   = 1
g.loaded_netrw             = 1
g.loaded_netrwPlugin       = 1
g.loaded_netrwSettings     = 1
g.loaded_netrwFileHandlers = 1
g.loaded_man               = 1
g.loaded_matchit           = 1
g.loaded_shada_plugin      = 1
g.loaded_spellfile_plugin  = 1
g.loaded_tarPlugin         = 1
g.skip_loading_mswin       = 1

g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0

-- vim.api.nvim_set_var(
--   "python3_host_prog",
--   "$XDG_CONFIG_HOME/nvim/python3/.venv/bin/python"
-- )
-- vim.api.nvim_set_var(
--     "node_host_prog",
--   "$HOME/.config/nvim/python3/node_modules/neovim/bin/cli.js"
-- )

require('base')
require('autocmd')
require('option')
require('keymap')
require('plugin')
