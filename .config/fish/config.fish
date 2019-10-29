set -gx XDG_CONFIG_HOME $HOME/.config

if not functions -q fisher
	# set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
	curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
	fish -c fisher
end

alias la='ls -a'
alias ll='ls -l'
alias lal='la -l'
alias grep='grep --color'
alias cx 'chmod +x'

functions --copy cd standard_cd

function cd
	standard_cd $argv; and la
end

alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# peco
set fish_plugins theme peco

function fish_user_key_bindings
	bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

# theme-bobthefish
set -g theme_color_scheme solarized-dark
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
# set -g theme_git_worktree_support yes
set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_ruby no
set -g theme_display_user yes
# set -g theme_display_vi no
# set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
# set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
# set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status no
set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt (set_color green)\uF558'  '

set -gx SDKROOT (xcrun --sdk macosx --show-sdk-path)

# PATH
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/apr/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl-openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/nss/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sphinx-doc/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -g fish_user_paths "$HOME/development/flutter/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)
