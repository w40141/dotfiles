" LSP Complement
" https://github.com/neoclide/coc.nvim
"

UsePlugin 'coc.nvim'

" If the following plugins dont install, the plugins are installed automatic when neovim starts.
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-dictionary',
            \ 'coc-elixir',
            \ 'coc-eslint',
            \ 'coc-fish',
            \ 'coc-git',
            \ 'coc-gitignore',
            \ 'coc-go',
            \ 'coc-html',
            \ 'coc-java',
            \ 'coc-java-debug',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-lua',
            \ 'coc-omni',
            \ 'coc-pairs',
            \ 'coc-phpls',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-solargraph',
            \ 'coc-sql',
            \ 'coc-texlab',
            \ 'coc-toml',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-word',
            \ 'coc-yaml',
            \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ?
            \ coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <plug>(coc-convert-snippet)

" Use <c-space> to trigger completion.
inoremap <silent> <expr> <c-@> coc#refresh()

let g:coc_status_error_sign = "\uF490 "
let g:coc_status_warning_sign ="\uF4A3 "

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <plug>(coc-diagnostic-prev)
nmap <silent> ]d <plug>(coc-diagnostic-next)

" Remap keys for gotos
" TODO: jump-coc-definition <leader>t
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <silent> gn <plug>(coc-rename)

" [
        " \ {"text": "(n)ew", "value": "new"},
        " \ {"text": "(e)dit", "value": "edit"}
" ]
" NOTE: text must contains '()' to detect input and its must be 1 character
function! ChoseAction(actions) abort
  echo join(map(copy(a:actions), { _, v -> v.text }), ", ") .. ": "
  let result = getcharstr()
  let result = filter(a:actions, { _, v -> v.text =~# printf(".*\(%s\).*", result)})
  return len(result) ? result[0].value : ""
endfunction

function! CocJumpAction() abort
  let actions = [
        \ {"text": "(s)plit", "value": "split"},
        \ {"text": "(v)slit", "value": "vsplit"},
        \ {"text": "(t)ab", "value": "tabedit"},
        \ ]
  return ChoseAction(actions)
endfunction

nnoremap <silent> gt :<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>

" Use H to show documentation in preview window
nnoremap <silent> H :call CocAction('doHover')<CR>

" Remap for format selected region
xmap <leader>fs  <plug>(coc-format-selected)
nmap <leader>fs  <plug>(coc-format-selected)

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <plug>(coc-codeaction-selected)
nmap <leader>a  <plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ca  <plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <plug>(coc-funcobj-i)
" omap if <plug>(coc-funcobj-i)
" xmap af <plug>(coc-funcobj-a)
" omap af <plug>(coc-funcobj-a)
" xmap ic <plug>(coc-classobj-i)
" omap ic <plug>(coc-classobj-i)
" xmap ac <plug>(coc-classobj-a)
" omap ac <plug>(coc-classobj-a)

" NOTE:
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <Leader>d <plug>(coc-range-select)
" xmap <silent> <Leader>d <plug>(coc-range-select)

nnoremap <silent> <Leader>f :<C-U>Format<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" For golang
autocmd MyAutoCmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd MyAutoCmd FileType go nmap gtj :CocCommand go.tags.add json<CR>
autocmd MyAutoCmd FileType go nmap gty :CocCommand go.tags.add yaml<CR>
autocmd MyAutoCmd FileType go nmap gtx :CocCommand go.tags.clear<CR>
