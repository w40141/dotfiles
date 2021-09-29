" Wrapper of some vim/neovim's :terminal functions.
" https://github.com/kassio/neoterm

set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/neoterm'

filetype plugin on

" 3<leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>

let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
let g:neoterm_autoscroll=1
let g:neoterm_shell = '$SHELL -l'

