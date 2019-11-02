"---------------------------------------------------------------------------
" emmet.vim
"
let g:user_emmet_mode = 'a'
" how to use
" push <C-t>
let g:user_emmet_leader_key = '<C-t>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
autocmd MyAutoCmd FileType * let g:user_emmet_settings.indentation = ''[:&tabstop]
