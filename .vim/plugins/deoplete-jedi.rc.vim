"---------------------------------------------------------------------------
" deoplete-jedi.vim
"

" let g:python3_host_prog	= '/usr/local/bin/python3'
" let g:python_host_prog	= '/usr/local/bin/python2'
autocmd MyAutoCmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd MyAutoCmd FileType python setlocal omnifunc=jedi#completions
" ポップアップを表示しない
autocmd MyAutoCmd FileType python setlocal completeopt-=preview
" g:deoplete#sources#jedi#enable_cache = 1
" Quick-runと競合しないように大文字Rに変更. READMEだと<leader>r
" let g:jedi#rename_command = '<leader>R'
" let g:jedi#auto_vim_configuration = 0
" 1個目の候補が入力されるっていう設定を解除
" let g:jedi#popup_select_first = 0
" .を入力すると補完が始まるという設定を解除
" let g:jedi#popup_on_dot = 0
" let g:jedi#auto_initialization = 0
" let g:jedi#completions_enabled = 0
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
