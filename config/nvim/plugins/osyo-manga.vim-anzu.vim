" Popup the number of search results 
" https://github.com/osyo-manga/vim-anzu

UsePlugin 'vim-anzu'

nmap n n<Plug>(anzu-update-search-status)
nmap N N<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <C-c><C-c> <ESC><ESC><Plug>(anzu-clear-search-status)
