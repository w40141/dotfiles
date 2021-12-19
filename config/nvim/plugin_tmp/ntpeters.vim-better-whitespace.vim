" Better whitespace highlighting for Vim
" https://github.com/ntpeters/vim-better-whitespace

UsePlugin 'ntpeters/vim-better-whitespace'

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:current_line_whitespace_disabled_soft=1
let g:better_whitespace_filetypes_blacklist= ['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>
