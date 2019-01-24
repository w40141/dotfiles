# エディタ
set -x EDITOR vim

# ページャ
set -x PAGER /usr/local/bin/vimpager
set -x MANPAGER /usr/local/bin/vimpager

# tmux
set -x TERM xterm-256color

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/apr/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/apr-util/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openldap/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openldap/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl-openssl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sphinx-doc/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libxml2/bin" $fish_user_paths
