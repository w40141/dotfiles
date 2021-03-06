"---------------------------------------------------------------------------
" ale.vim
"

" エラー行に表示するマーク
let g:ale_sign_error = "\uF490"
let g:ale_sign_warning = "\uF4A3"
let g:ale_sign_ok = "\uF4A1"
let g:ale_statusline_format = [g:ale_sign_error, g:ale_sign_warning, g:ale_sign_ok]
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_error_str = "E"
let g:ale_echo_msg_warning_str = "W"
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" 有効にするlinter
let g:ale_linters = {
\   'python': ['flake8', 'mypy', 'isort'],
\		'g++':['clang'],
\		'javascript':['eslint'],
\		'vim':['vint']
\}

" ALE用プレフィックス
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous_wrap)
nmap <silent> [ale]<C-N> <Plug>(ale_next_wrap)

" ale
" function! s:ale_string(mode)
"   if !exists('g:ale_buffer_info')
"     return ''
"   endif
"
"   let l:buffer = bufnr('%')
"   let l:counts = ale#statusline#Count(l:buffer)
"   let [l:error_format, l:warning_format, l:no_errors] = g:ale_statusline_format
"
"   if a:mode == 0 " Error
"     let l:errors = l:counts.error + l:counts.style_error
"     return l:errors ? printf(l:error_format . ' %d', l:errors) : ''
"   elseif a:mode == 1 " Warning
"     let l:warnings = l:counts.warning + l:counts.style_warning
"     return l:warnings ? printf(l:warning_format . ' %d', l:warnings) : ''
"   endif
"
"   return l:counts.total ? '' : l:no_errors
" endfunction

" " MyAleFunc
" function! MyAleError()
"   return winwidth(0) > 70 ? s:ale_string(0) : ''
" endfunction

" function! MyAleWarning()
"   return winwidth(0) > 70 ? s:ale_string(1) : ''
" endfunction

" function! MyAleOk()
"   return winwidth(0) > 70 ? s:ale_string(2) : ''
" endfunction

" autocmd MyAutoCmd User ALELintPost call lightline#update()
