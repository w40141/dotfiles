" The ultimate testing plugin for (Neo)Vim
" https://github.com/rcarriga/vim-ultest

UsePlugin 'vim-ultest'

nmap ]t <plug>(ultest-next-fail)
nmap [t <plug>(ultest-prev-fail)

let test#python#pytest#options = "--color=yes"
let test#javascript#jest#options = "--color=always"
