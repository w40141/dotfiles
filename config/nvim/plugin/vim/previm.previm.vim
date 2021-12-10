" Preview for markdown
" https://github.com/tweekmonster/startuptime.vim

UsePlugin 'previm'

let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'
nnoremap <silent> ,o :<C-u>PrevimOpen<CR>
