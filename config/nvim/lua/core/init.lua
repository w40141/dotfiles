local v = vim
local g = v.g

g.loaded_gzip = 1

g.loaded_matchparen = 1

g.loaded_tarPlugin = 1
g.loaded_tar = 1

g.loaded_zipPlugin = 1
g.loaded_zip = 1

g.loaded_netrw = 1

-- runtime/plugin/*
g.loaded_man = 1

g.loaded_remote_plugins = 1
g.loaded_shada_plugin = 1
g.loaded_2html_plugin = 0
g.loaded_tutor_mode_plugin = 0

g.did_install_default_menus = 1

g.did_install_syntax_menu = 0

-- provider
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

require("core.filetype")
require("core.option")
require("core.keymap")
require("core.event")
require("core.plugin")
