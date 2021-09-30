" Use register history
" https://github.com/LeafCage/yankround.vim

UsePlugin 'yankround.vim'

nmap p <plug>(yankround-p)
xmap p <plug>(yankround-p)
nmap P <plug>(yankround-P)
nmap gp <plug>(yankround-gp)
xmap gp <plug>(yankround-gp)
nmap gP <plug>(yankround-gP)
nmap <C-p> <plug>(yankround-prev)
nmap <C-n> <plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
