" Preview for markdown
" https://github.com/tweekmonster/startuptime.vim

UsePlugin 'previm'

let g:previm_open_cmd = 'open -a Google\ Chrome'
nnoremap <silent> <Leader><Leader>o :<C-u>PrevimOpen<CR>
let g:previm_enable_realtime = 1
