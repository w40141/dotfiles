UsePlugin 'vim-operator-surround'

" saiw(
nmap <silent>sa <Plug>(operator-surround-append)
" sda(
nmap <silent>sd <Plug>(operator-surround-delete)
" sra"'
nmap <silent>sr <Plug>(operator-surround-replace)
" カーソル位置から一番近い括弧を削除する
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" " カーソル位置から一番近い括弧を変更する
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
