local gl = require("core.global")
local g = gl.g

local disable_distribution_plugins = function()
  g.did_install_default_menus = 1
  g.did_install_syntax_menu = 1
  g.loaded_2html_plugin = 1
  g.loaded_gzip = 1
  g.loaded_matchit = 1
  g.loaded_netrw = 1
  g.loaded_netrwFileHandlers = 1
  g.loaded_netrwPlugin = 1
  g.loaded_netrwSettings = 1
  g.loaded_node_provider = 0
  g.loaded_perl_provider = 0
  g.loaded_python3_provider = 0
  g.loaded_remote_plugins = 1
  g.loaded_rrhelper = 1
  g.loaded_ruby_provider = 0
  g.loaded_spellfile_plugin = 1
  g.loaded_sql_completion = 1
  g.loaded_syntax_completion = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_vimball = 1
  g.loaded_vimballPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1
  g.netrw_liststyle = 3
end

local clipboard_config = function()
  if gl.is_mac then
    g.clipboard = {
      name = "macOS-clipboard",
      copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
      paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
      cache_enabled = 0,
    }
  elseif gl.is_wsl then
    g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 0,
    }
  end
end

local load_core = function()
  disable_distribution_plugins()
  clipboard_config()
  require("core.option")
  require("core.keymap")
  require("core.event")
  require("core.pack")
end

load_core()
