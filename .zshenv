# -------------------------------------
# 環境変数
# -------------------------------------

# {{{

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ for vim
export EDITOR=/usr/local/bin/vim

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager

# }}}

# -------------------------------------
# パス
# -------------------------------------

# {{{

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

export PATH="/usr/local/bin:/usr/local/sbin:/usr:/usr/bin:./.pyenv/versions/2.7.6/lib/python2.7/site-packages:$PATH"

path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

# }}}

