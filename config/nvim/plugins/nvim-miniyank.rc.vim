UsePlugin 'nvim-miniyank'

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

map gp <Plug>(miniyank-startput)
map gP <Plug>(miniyank-startPut)
map <C-n> <Plug>(miniyank-cycle)
map <C-N> <Plug>(miniyank-cycleback)

map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)
map <Leader>b <Plug>(miniyank-toblock)

let g:miniyank_maxitems = 100
