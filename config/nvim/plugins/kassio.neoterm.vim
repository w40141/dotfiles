" Wrapper of some vim/neovim's :terminal functions.
" https://github.com/kassio/neoterm

set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/neoterm'

filetype plugin on

let g:neoterm_default_mod='vertical'
let g:neoterm_size=50
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll=1
let g:neoterm_shell = '$SHELL -l'

function! NTermHolizontalSplit()
    let l:tmp = g:neoterm_default_mod
    let g:neoterm_default_mod = "belowright"
    Tnew
    let g:neoterm_default_mod = l:tmp
endfunction

function! NTermVerticalSplit()
    let l:tmp = g:neoterm_default_mod
    let g:neoterm_default_mod = "vertical"
    Tnew
    let g:neoterm_default_mod = l:tmp
endfunction

nnoremap <silent> <C-t><C-t> :Ttoggle<CR>
tnoremap <silent> <C-t><C-t> <C-\><C-n>:Ttoggle<CR>

nnoremap <silent> <C-t><C-h> :call NTermHolizontalSplit()<CR>
nnoremap <silent> <C-t><C-v> :call NTermVerticalSplit()<CR>

" terminal mapping
" 新しいタブでターミナルを起動
nnoremap @T :tabe<CR>:terminal<CR>
" Ctrl + q でターミナルを終了
tnoremap <C-q> <C-\><C-n>:q<CR>
" <C-j>でターミナルモードからノーマルモードへ
tnoremap <C-j> <C-\><C-n>
" ターミナルモードでのタブ移動
tnoremap <C-l> <C-\><C-n>gt
nnoremap <silent> <C-e> V:TREPLSendLine<cr>j^
vnoremap <silent> <C-e> V:TREPLSendSelection<cr>'>j^

