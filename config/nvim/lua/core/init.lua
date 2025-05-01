local v = vim
local g = v.g

g.loaded_netrw = 1
g.loaded_tar = 1
g.loaded_zip = 1

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

pcall(require, "core.option")
pcall(require, "core.keymap")
pcall(require, "core.event")
pcall(require, "core.plugin")
