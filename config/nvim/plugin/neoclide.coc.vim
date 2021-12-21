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

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

let g:coc_status_error_sign = "\uF490 "
let g:coc_status_warning_sign ="\uF4A3 "

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent> <expr> <cr> pumvisible() ?
            \ coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <plug>(coc-snippets-expand-jump)

" Use [dev]x for convert visual selected code to snippet
xmap [dev]x  <plug>(coc-convert-snippet)

" Use <c-space> to trigger completion.
inoremap <silent> <expr> <c-@> coc#refresh()

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <plug>(coc-diagnostic-prev)
nmap <silent> ]d <plug>(coc-diagnostic-next)

" Remap keys for gotos
" TODO: jump-coc-definition [dev]t
nmap <silent> [dev]d <plug>(coc-definition)
nmap <silent> [dev]y <plug>(coc-type-definition)
nmap <silent> [dev]i <plug>(coc-implementation)
nmap <silent> [dev]r <plug>(coc-references)
nmap <silent> [dev]n <plug>(coc-rename)

nnoremap <silent> gt :<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>

" Use H to show documentation in preview window
nnoremap <silent> H :call CocAction('doHover')<CR>

" Remap for format selected region
xmap [dev]fs <plug>(coc-format-selected)
nmap [dev]fs <plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `[dev]aap` for current paragraph
nmap [dev]a <Plug>(coc-codeaction-selected)iw
xmap [dev]a <Plug>(coc-codeaction-selected)iw

" Remap for do codeAction of current line
nmap [dev]c <plug>(coc-codeaction)
" Fix autofix problem of current line
nmap [dev]q <plug>(coc-fix-current)

nnoremap [dev]f :<C-U>Format<CR>

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

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

lua << EOF
-- local key = vim.api.nvim_set_keymap
-- key('n', '[ff]p', [[:<c-u>CocCommand fzf-preview.FromResources buffer project_mru project<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]s', [[:<c-u>CocCommand fzf-preview.GitStatus<cr>]], { noremap = true, silent = true } )
-- key('n', '[ff]g', [[:<c-u>CocCommand fzf-preview.GitActions<cr>]], { noremap = true, silent = true } )
--
-- key('n', '[ff]b', [[:<c-u>CocCommand fzf-preview.Buffers<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]f', [[:<c-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<space>]], { noremap = true, silent = false })
-- key('x', '[ff]f', [[sy:<c-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<space>-F<space>"<c-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>]], { noremap = true, silent = false })
--
-- key('n', '[ff]q', [[:<c-u>CocCommand fzf-preview.CocCurrentDiagnostics<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]r', [[:<c-u>CocCommand fzf-preview.CocReferences<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]d', [[:<c-u>CocCommand fzf-preview.CocDefinition<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]t', [[:<c-u>CocCommand fzf-preview.CocTypeDefinition<cr>]], { noremap = true, silent = true })
-- key('n', '[ff]o', [[:<c-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<cr>]], { noremap = true, silent = true })
EOF
