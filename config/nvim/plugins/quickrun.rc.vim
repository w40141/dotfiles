UsePlugin 'quickrun'
echo 'quickrun'

nmap <Leader>qr <Plug>(quickrun)
let g:quickrun_config = {'*': {'runner': 'remote/vimproc'}, }
let g:quickrun_config={'*': {'split': 'vertical'}}
set splitright
