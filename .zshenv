# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

export PATH="/usr/bin:/usr/local/bin:/usr/local/sbin:/usr:$PATH"
# export PATH="/usr/bin:/usr/local/bin:/usr/local/sbin:/usr:/usr/bin:$PATH"

path=(~/bin(N-/) /usr/local/bin(N-/) /usr/local/sbin(N-/) /usr/bin(N-/) $path)
