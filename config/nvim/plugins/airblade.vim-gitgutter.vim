" Show a git diff
" https://github.com/airblade/vim-gitgutter

UsePlugin 'vim-gitgutter'

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➤'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = "➜"
let g:gitgutter_highlight_lines = 0
nmap ]h <plug>(GitGutterNextHunk)
nmap [h <plug>(GitGutterPrevHunk)
