" Popup the number of search results 
" https://github.com/osyo-manga/vim-anzu

UsePlugin 'vim-anzu'

nmap n n<plug>(anzu-update-search-status)
nmap N N<plug>(anzu-update-search-status)
nmap * <plug>(anzu-star-with-echo)
nmap # <plug>(anzu-sharp-with-echo)
" clear status
nmap <C-c><C-c> <ESC><ESC><plug>(anzu-clear-search-status)
