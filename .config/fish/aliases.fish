balias la 'ls -a'
balias lal 'la -l'

# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
balias grep "grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# tree
balias tree "tree -NC" # N: 文字化け対策, C:色をつける
