" Open url with a browser
" https://github.com/tyru/open-browser.vim

UsePlugin 'open-browser.vim'

let g:netrw_nogx = 1
nmap gx <plug>(openbrowser-smart-search)
vmap gx <plug>(openbrowser-smart-search)
" nnoremap <Leader>o :<C-u>execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')<CR>
