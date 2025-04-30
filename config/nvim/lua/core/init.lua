local v = vim
local g = v.g

-- runtime/plugin/*
g.loaded_gzip = 0
g.loaded_man = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_netrwPlugin = 0
g.loaded_remote_plugins = 0
g.loaded_shada_plugin = 0
g.loaded_tarPlugin = 0
g.loaded_2html_plugin = 0
g.loaded_tutor_mode_plugin = 0
g.loaded_zipPlugin = 0

g.did_install_default_menus = 1

g.did_install_syntax_menu = 0

-- provider
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

require("core.option")
require("core.keymap")
require("core.event")
require("core.plugin")
