"---------------------------------------------------------------------------
" deoplete.nvim
"

" set completeopt-=preview " プレビューウィンドウを開かないようにする
" set completeopt+=noinsert " 最初の候補がデフォで選択されるようにする
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?
" " inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" snoremap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" " inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
