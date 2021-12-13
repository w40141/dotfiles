" Simpler Rainbow Parentheses
" https://github.com/junegunn/rainbow_parentheses.vim

UsePlugin 'rainbow_parentheses.vim'

nnoremap <silent> <C-w>r :<C-u>RainbowParentheses!!<CR>
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType javascript,typescript,lisp,clojure,scheme RainbowParentheses
augroup END
