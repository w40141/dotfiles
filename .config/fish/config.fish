set -x XDG_CONFIG_HOME $HOME/.config

alias la='ls -a'
alias ll='ls -l'
alias lal='la -l'

functions --copy cd standard_cd

function cd
	standard_cd $argv; and la
end

# rbenv
status --is-interactive; and source (rbenv init - |psub)

# set fish_plugins theme git rbenv rails brew bundler gem osx pbcopy better-alias gi peco z tmux

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
set -g theme_newline_prompt \uF558'  '

# set_tmp
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/openssl/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/sqlite/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/liblwgeom/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/qt/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/nss/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/curl/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/curl-openssl/include"
# set -gx CPPFLAGS $CPPFLAGS "-I/usr/local/opt/llvm/include"
# set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH "/usr/local/opt/sqlite/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH "/usr/local/opt/nss/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH "/usr/local/opt/curl/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH "/usr/local/opt/curl-openssl/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH $PKG_CONFIG_PATH "/usr/local/opt/qt/lib/pkgconfig"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/openssl/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/sqlite/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/liblwgeom/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/qt/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/nss/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/llvm/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/curl/lib"
# set -gx LDFLAGS $LDFLAGS "-L/usr/local/opt/curl-openssl/lib"

# set
# set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
# set -gx CPPFLAGS "-I/usr/local/opt/sqlite/include"
# set -gx CPPFLAGS "-I/usr/local/opt/liblwgeom/include"
# set -gx CPPFLAGS "-I/usr/local/opt/qt/include"
# set -gx CPPFLAGS "-I/usr/local/opt/nss/include"
# set -gx CPPFLAGS "-I/usr/local/opt/curl/include"
# set -gx CPPFLAGS "-I/usr/local/opt/curl-openssl/include"
# set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/sqlite/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/nss/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/curl/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/curl-openssl/lib/pkgconfig"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/qt/lib/pkgconfig"
# set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
# set -gx LDFLAGS "-L/usr/local/opt/sqlite/lib"
# set -gx LDFLAGS "-L/usr/local/opt/liblwgeom/lib"
# set -gx LDFLAGS "-L/usr/local/opt/qt/lib"
# set -gx LDFLAGS "-L/usr/local/opt/nss/lib"
# set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
# set -gx LDFLAGS "-L/usr/local/opt/curl/lib"
# set -gx LDFLAGS "-L/usr/local/opt/curl-openssl/lib"

# PATH
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/nss/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl-openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sphinx-doc/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/apr/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
