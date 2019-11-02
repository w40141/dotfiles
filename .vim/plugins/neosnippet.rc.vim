"---------------------------------------------------------------------------
" neosnippet.vim
"

" Plugin key-mappings.
" <C-g>で展開
imap <C-g>     <Plug>(neosnippet_expand_or_jump)
smap <C-g>     <Plug>(neosnippet_expand_or_jump)
xmap <C-g>     <Plug>(neosnippet_expand_target)
" imap <C-s>     <Plug>(neosnippet_start_unite_snippet)
" xmap <C-o>     <Plug>(neosnippet_register_oneshot_snippet)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
"       \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
"       \: "\<TAB>"

" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
snoremap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
"
let g:neosnippet#enable_complete_done = 1
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#snippets_directory = '$XDG_CONFIG_HOME/nvim/snippets'
