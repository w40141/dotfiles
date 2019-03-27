set -x XDG_CONFIG_HOME $HOME/.config

alias la='ls -a'
alias ll='ls -l'
alias lal='la -l'

functions --copy cd standard_cd

function cd
	standard_cd $argv; and la
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
set -g fish_prompt_pwd_dir_length 1
# set -g theme_project_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt '>>> '

# set
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"
set -gx LDFLAGS "-L/usr/local/opt/sqlite/lib"
set -gx CPPFLAGS "-I/usr/local/opt/sqlite/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/sqlite/lib/pkgconfig"
set -gx LDFLAGS "-L/usr/local/opt/liblwgeom/lib"
set -gx CPPFLAGS "-I/usr/local/opt/liblwgeom/include"
set -gx LDFLAGS "-L/usr/local/opt/qt/lib"
set -gx CPPFLAGS "-I/usr/local/opt/qt/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/qt/lib/pkgconfig"
set -gx LDFLAGS "-L/usr/local/opt/nss/lib"
set -gx CPPFLAGS "-I/usr/local/opt/nss/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/nss/lib/pkgconfig"
set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"

# PATH
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/nss/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
