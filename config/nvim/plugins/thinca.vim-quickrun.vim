" Run a command and show its result quickly
" https://github.com/thinca/vim-quickrun

UsePlugin 'vim-quickrun'

nmap ,q <Plug>(quickrun)
let g:quickrun_config = {'*': {'runner': 'remote/vimproc'}, }
let g:quickrun_config={'*': {'split': 'vertical'}}
set splitright
