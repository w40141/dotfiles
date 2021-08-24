" fzf vim
" https://github.com/junegunn/fzf.vim

UsePlugin 'fzf.vim'

" set rtp+=/usr/local/opt/fzf
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" fzf settings
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

" Default fzf layout
" - Popup window (center of the screen)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" 
" " - Popup window (center of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
" 
" " - Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
" 
" " - down / up / left / right
" let g:fzf_layout = { 'down': '40%' }
" 
" " - Window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'],
  \ }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_buffers_jump = 1

augroup vimrc_fzf
  autocmd!
  autocmd FileType fzf tnoremap <buffer> <C-q> <Esc>
  autocmd FileType fzf tnoremap <buffer> <C-p> <UP>
  autocmd FileType fzf tnoremap <buffer> <C-k> <UP>
  autocmd FileType fzf tnoremap <buffer> <C-n> <DOWN>
  autocmd FileType fzf tnoremap <buffer> <C-j> <DOWN>
  " autocmd FileType fzf set laststatus=0 noshowmode noruler
  "      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Filesコマンドにもプレビューを出す
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

"" fzf.vim
" <C-p>でファイル検索を開く
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun

" fzf
nnoremap <silent> <C-o> :call FzfOmniFiles()<CR>
nnoremap <silent> <leader>F :Files<CR>
" nnoremap <silent> <C-f>g :GFiles<CR>
nnoremap <silent> <C-F>G :GFiles?<CR>
nnoremap <silent> <C-B> :Buffers<CR>


" カーソル位置の単語をファイル検索する
nnoremap <C-g> vawy:Rg <C-R>"<CR>
" 単語検索を開く
nnoremap <silent> <leader>g :RG<CR>
" 選択した単語をファイル検索する
xnoremap <C-F>g y:Rg <C-R>"<CR>

" flで開いているファイルの文字列検索を開く
nnoremap <C-F>l :BLines<CR>
" fmでマーク検索を開く
nnoremap <C-F>m :Marks<CR>
" fhでファイル閲覧履歴検索を開く
nnoremap <C-F>h :History<CR>
" fcでコミット履歴検索を開く
nnoremap <C-F>c :Commits<CR>

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
" Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent><C-F>t :<C-u>call<C-F>zf#vim#tags(expand('<cword>'))<CR>
