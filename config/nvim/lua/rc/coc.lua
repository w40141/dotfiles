-- LSP Complement
-- https://github.com/neoclide/coc.nvim
local key = vim.api.nvim_set_keymap
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn

function _G.check_back_space()
    local col = fn.col(".") - 1
    if col == 0 or fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- If the following plugins dont install, the plugins are installed automatic when neovim starts.
-- Use `:Format` to format current buffer
cmd([[command! -nargs=0 Format :call CocAction('format')]])
-- command! -nargs=0 Prettier :CocCommand prettier.formatFile

-- Use `:Fold` to fold current buffer
cmd([[command! -nargs=? Fold :call CocAction('fold', <f-args>)]])

-- use `:OR` for organize import of current buffer
cmd([[command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')]])

-- For golang
cmd([[autocmd MyAutoCmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')]])
cmd([[autocmd MyAutoCmd FileType go nmap gtj :CocCommand go.tags.add json<CR>]])
cmd([[autocmd MyAutoCmd FileType go nmap gty :CocCommand go.tags.add yaml<CR>]])
cmd([[autocmd MyAutoCmd FileType go nmap gtx :CocCommand go.tags.clear<CR>]])

-- Setup formatexpr specified filetype(s).
-- Update signature help on jump placeholder
cmd([[augroup MyAutoCmd]])
cmd([[autocmd!]])
cmd([[autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')]])
cmd([[autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')]])
cmd([[augroup end]])

cmd([[
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
]])

vim.opt.shell = '/bin/zsh'
cmd([[let $SHELL = "/bin/zsh"]])

g['coc_global_extensions'] = {
    'coc-css',
    'coc-dictionary',
    'coc-elixir',
    'coc-eslint',
    'coc-fish',
    'coc-git',
    'coc-gitignore',
    'coc-go',
    'coc-html',
    'coc-java',
    'coc-java-debug',
    'coc-json',
    'coc-lists',
    'coc-lua',
    'coc-omni',
    'coc-pairs',
    'coc-phpls',
    'coc-prettier',
    'coc-pyright',
    'coc-rust-analyzer',
    'coc-snippets',
    'coc-solargraph',
    'coc-sql',
    'coc-texlab',
    'coc-toml',
    'coc-tsserver',
    'coc-vetur',
    'coc-vimlsp',
    'coc-word',
    'coc-yaml',
}

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
g['coc_snippet_next'] = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
g['coc_snippet_prev'] = '<c-k>'

key('i', '<tab>', [[pumvisible() ? "\<c-n>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]],
    { expr = true, noremap = true, silent = true })
key('i', '<s-tab>', [[pumvisible() ? "\<c-p>" : "\<c-h>"]], { expr = true, noremap = true, silent = true })
key('i', '<cr>', [[pumvisible() ? "\<c-y>" : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    { expr = true, noremap = true, silent = true })

key('i', '<c-l>', [[<plug>(coc-snippets-expand)]], { noremap = false, silent = false })
key('v', '<c-j>', [[<plug>(coc-snippets-select)]], { noremap = false, silent = false })
key('i', '<c-j>', [[<plug>(coc-snippets-expand-jump)]], { noremap = false, silent = false })
key('x', '[dev]x', [[<plug>(coc-convert-snippet)]], { noremap = true, silent = false })
key('i', '<c-@>', [[coc#refresh]], { noremap = true, silent = false })
key('n', 'H', [[:call CocAction('doHover')<cr>]], { noremap = true, silent = false })
key('n', '[g', [[<plug>(coc-diagnostic-prev)]], { noremap = false, silent = false })
key('n', ']g', [[<plug>(coc-diagnostic-next)]], { noremap = false, silent = false })
key('n', '[dev]d', [[<plug>(coc-definition)]], { noremap = false, silent = false })
key('n', '[dev]y', [[<plug>(coc-type-definition)]], { noremap = false, silent = false })
key('n', '[dev]i', [[<plug>(coc-implementation)]], { noremap = false, silent = false })
key('n', '[dev]r', [[<plug>(coc-references)]], { noremap = false, silent = false })
key('n', '[dev]n', [[<plug>(coc-rename)]], { noremap = false, silent = false })
key('n', '[dev]t', [[:<C-u>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>]],
    { noremap = true, silent = false })
key('n', '[dev]fs', [[<plug>(coc-format-selected)]], { noremap = false, silent = false })
key('x', '[dev]fs', [[<plug>(coc-format-selected)]], { noremap = false, silent = false })
key('n', '[dev]a', [[<plug>(coc-codeaction-selected)iw]], { noremap = false, silent = false })
key('x', '[dev]a', [[<plug>(coc-codeaction-selected)iw]], { noremap = false, silent = false })
key('n', '[dev]q', [[<plug>(coc-fix-current)]], { noremap = false, silent = false })
key('n', '[dev]f', [[:<c-u>Format<cr>]], { noremap = true })

key('n', '[ff]q', [[:<c-u>CocCommand fzf-preview.CocDiagnostics<cr>]], { noremap = true, silent = true })
key('n', '[ff]r', [[:<c-u>CocCommand fzf-preview.CocReferences<cr>]], { noremap = true, silent = true })
key('n', '[ff]d', [[:<c-u>CocCommand fzf-preview.CocDefinition<cr>]], { noremap = true, silent = true })
key('n', '[ff]t', [[:<c-u>CocCommand fzf-preview.CocTypeDefinition<cr>]], { noremap = true, silent = true })
key('n', '[ff]o', [[:<c-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<cr>]],
    { noremap = true, silent = true })

cmd([[hi! CocErrorSign guifg=#E82424]])
cmd([[hi! CocWarninSign guifg=#FF9E3B]])
cmd([[hi! CocInfoSign guifg=#6A9589]])
cmd([[hi! CocHSign guifg=#658594]])
