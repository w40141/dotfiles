"---------------------------------------------------------------------------
" caw.vim
"

" 行の最初の文字の前にコメント文字をトグル
nmap gcc <Plug>(caw:hatpos:toggle)
vmap gcc <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nmap gc, <Plug>(caw:zeropos:toggle)
vmap gc, <Plug>(caw:zeropos:toggle)

" function! InitCaw() abort
" 	if !&l:modifiable
" 		" gcc コメントアウト
" 		" gci 文の頭からコメントアウト
" 		" gcI 行頭からコメントアウト
" 		" gca 行末にコメントアウト
" 		" gco カーソル行の下にコメントアウト
" 		" gcO カーソル行の上にコメントアウト
" 		silent! nunmap <buffer> gc
" 		silent! xunmap <buffer> gc
" 		silent! nunmap <buffer> gcc
" 		silent! xunmap <buffer> gcc
" 	else
" 		nmap <buffer> gc <Plug>(caw:prefix)
" 		xmap <buffer> gc <Plug>(caw:prefix)
" 		nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
" 		xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
" 	endif
" endfunction
" autocmd MyAutoCmd FileType * call InitCaw()
"
