" Git status implementation for defx.nvim
" https://github.com/kristijanhusak/defx-git

UsePlugin 'defx-git'

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹ ',
  \ 'Staged'    : '✚ ',
  \ 'Untracked' : '✭ ',
  \ 'Renamed'   : '➜ ',
  \ 'Unmerged'  : '═ ',
  \ 'Ignored'   : '☒ ',
  \ 'Deleted'   : '✖ ',
  \ 'Unknown'   : '? '
  \ })
