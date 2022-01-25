" LSP Complement
" https://github.com/neoclide/coc.nvim

" UsePlugin 'coc.nvim'

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
set shell=/bin/zsh
let $SHELL = "/bin/zsh"
let $BAT_THEME                     = 'gruvbox-dark'
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'
" fzf command default options
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }

lua << EOF
local key = vim.api.nvim_set_keymap

key('i', '<tab>', [[pumvisible() ? "\<c-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()]], { expr = true, noremap = true, silent = true })
key('i', '<s-tab>', [[pumvisible() ? "\<c-p>" : "\<c-h>"]], { expr = true, noremap = true, silent = true })
key('i', '<cr>', [[pumvisible() ? "\<c-y>" : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { expr = true, noremap = true, silent = true})

key('i', '<c-l>',   [[<plug>(coc-snippets-expand)]], { noremap = false, silent = false})
key('v', '<c-j>',   [[<plug>(coc-snippets-select)]], { noremap = false, silent = false})
key('i', '<c-j>',   [[<plug>(coc-snippets-expand-jump)]], { noremap = false, silent = false})
key('x', '[dev]x',  [[<plug>(coc-convert-snippet)]], { noremap = true, silent = false })
key('i', '<c-@>',   [[coc#refresh]], { noremap = true, silent = false })
key('n', 'H',       [[:call CocAction('doHover')<cr>]], { noremap = true, silent = false })
key('n', '[g',      [[<plug>(coc-diagnostic-prev)]], { noremap = false, silent = false })
key('n', ']g',      [[<plug>(coc-diagnostic-next)]], { noremap = false, silent = false })
key('n', '[dev]d',  [[<plug>(coc-definition)]], { noremap = false, silent = false })
key('n', '[dev]y',  [[<plug>(coc-type-definition)]], { noremap = false, silent = false })
key('n', '[dev]i',  [[<plug>(coc-implementation)]], { noremap = false, silent = false })
key('n', '[dev]r',  [[<plug>(coc-references)]], { noremap = false, silent = false })
key('n', '[dev]n',  [[<plug>(coc-rename)]], { noremap = false, silent = false })
key('n', '[dev]t',  [[:<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>]], { noremap = true, silent = false })
key('n', '[dev]fs', [[<plug>(coc-format-selected)]], { noremap = false, silent = false })
key('x', '[dev]fs', [[<plug>(coc-format-selected)]], { noremap = false, silent = false })
key('n', '[dev]a',  [[<plug>(coc-codeaction-selected)iw]], { noremap = false, silent = false })
key('x', '[dev]a',  [[<plug>(coc-codeaction-selected)iw]], { noremap = false, silent = false })
key('n', '[dev]q',  [[<plug>(coc-fix-current)]], { noremap = false, silent = false })
key('n', '[dev]f',  [[:<c-u>Format<cr>]], { noremap = true })

key('n', '[ff]s', [[:<c-u>CocCommand fzf-preview.GitStatus<cr>]], { noremap = true, silent = true } )
key('n', '[ff]g', [[:<c-u>CocCommand fzf-preview.GitActions<cr>]], { noremap = true, silent = true } )

key('n', '[ff]p', [[:<c-u>CocCommand fzf-preview.FromResources buffer project_mru project<cr>]], { noremap = true, silent = true })
key('n', '[ff]b', [[:<c-u>CocCommand fzf-preview.Buffers<cr>]], { noremap = true, silent = true })
key('n', '[ff]f', [[:<c-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<space>]], { noremap = true, silent = false })
key('x', '[ff]f', [["sy:<c-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<space>-F<space>"<c-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>]], { noremap = true, silent = false })

key('n', '[ff]/', [[:<c-u>CocCommand fzf-preview.Lines --resume --add-fzf-arg=--no-sort<cr>]], { noremap = true, silent = true })
key('n', '[ff]*', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=expand('<cword>')<CR>"<CR>]], { noremap = true, silent = true })
key('x', '[ff]*', [["sy:CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=substitute(@s, '\(^\\v\)\\|\\\(<\\|>\)', '', 'g')<CR>"<CR>]], { noremap = true, silent = true })
key('n', '[ff]n', [[:<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="<C-r>=substitute(@/, '\(^\\v\)\\|\\\(<\\|>\)', '', 'g')<CR>"<CR>]], { noremap = true, silent = true })
key('n', '[ff]?', [[:<C-u>CocCommand fzf-preview.BufferLines --resume --add-fzf-arg=--no-sort<CR>]], { noremap = true, silent = true })

key('n', '[ff]q', [[:<c-u>CocCommand fzf-preview.CocCurrentDiagnostics<cr>]], { noremap = true, silent = true })
key('n', '[ff]r', [[:<c-u>CocCommand fzf-preview.CocReferences<cr>]], { noremap = true, silent = true })
key('n', '[ff]d', [[:<c-u>CocCommand fzf-preview.CocDefinition<cr>]], { noremap = true, silent = true })
key('n', '[ff]t', [[:<c-u>CocCommand fzf-preview.CocTypeDefinition<cr>]], { noremap = true, silent = true })
key('n', '[ff]o', [[:<c-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<cr>]], { noremap = true, silent = true })
EOF
