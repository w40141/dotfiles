set -x XDG_CONFIG_HOME "~/.config"

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

set -U FZF_LEGACY_KEYBINDINGS 0
