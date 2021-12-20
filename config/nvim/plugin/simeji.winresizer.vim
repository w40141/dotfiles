" very simple vim plugin for easy resizing of your vim windows
" https://github.com/simeji/winresizer

UsePlugin 'winresizer'

" If you want to start window resize mode by `Ctrl+T`
" let g:winresizer_start_key = '<C-w>'

" If you want to cancel and quit window resize mode by `z` (keycode 122)
" let g:winresizer_keycode_cancel = 122

" To expand your window size toward upper using upper arrow (instead of k)
" let g:winresizer_keycode_up = "\<UP>"
" To expand your window size toward lower using down arrow (instead of j)
" let g:winresizer_keycode_down = "\<DOWN>"

lua << EOF
-- If you want to start window resize mode by `Ctrl+T`
vim.g.winresizer_start_key = "<c-w>"
vim.g.winresizer_keycode_cancel = 122

-- To expand your window size toward upper using upper arrow (instead of k)
vim.g.winresizer_keycode_up = "<UP>"
-- To expand your window size toward lower using down arrow (instead of j)
vim.g.winresizer_keycode_down = "<DOWN>"
EOF
