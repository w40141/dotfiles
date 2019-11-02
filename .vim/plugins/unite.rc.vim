"---------------------------------------------------------------------------
" unite.vim
"

call g:unite#custom_default_action('source/bookmark/directory', 'vimfiler')
call g:unite#custom_default_action('directory', 'vimfiler')
call g:unite#custom_default_action('directory_mru', 'vimfiler')
function! s:unite_settings()
  imap <buffer> <Esc><Esc> <Plug>(unite_exit)
  nmap <buffer> <Esc> <Plug>(unite_exit)
  nmap <buffer> <C-n> <Plug>(unite_select_next_line)
  nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
endfunction
autocmd MyAutoCmd FileType unite call s:unite_settings()
