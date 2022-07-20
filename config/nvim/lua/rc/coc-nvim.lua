-- LSP Complement
-- https://github.com/neoclide/coc.nvim
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

local key = vim.keymap.set
key('i', '<tab>', [[pumvisible() ? "\<c-n>" : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]],
    { expr = true, noremap = true, silent = true })
key('i', '<s-tab>', [[pumvisible() ? "\<c-p>" : "\<c-h>"]], { expr = true, noremap = true, silent = true })
key('i', '<cr>', [[pumvisible() ? "\<c-y>" : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    { expr = true, noremap = true, silent = true })

local ff = { noremap = false, silent = false }
local tf = { noremap = true, silent = false }
key('i', '<c-l>', "<plug>(coc-snippets-expand)", ff)
key('v', '<c-j>', "<plug>(coc-snippets-select)", ff)
key('i', '<c-j>', "<plug>(coc-snippets-expand-jump)", ff)
key('x', '[dev]x', "<plug>(coc-convert-snippet)", tf)
key('i', '<c-@>', "coc#refresh", tf)
key('n', 'H', "<cmd>call CocAction('doHover')<cr>", tf)
key('n', '[g', "<plug>(coc-diagnostic-prev)", ff)
key('n', ']g', "<plug>(coc-diagnostic-next)", ff)
key('n', '[dev]d', "<plug>(coc-definition)", ff)
key('n', '[dev]y', "<plug>(coc-type-definition)", ff)
key('n', '[dev]i', "<plug>(coc-implementation)", ff)
key('n', '[dev]r', "<plug>(coc-references)", ff)
key('n', '[dev]n', "<plug>(coc-rename)", ff)
key('n', '[dev]t', "<cmd>call CocActionAsync('jumpDefinition', CocJumpAction())<CR>", tf)
key('n', '[dev]fs', "<plug>(coc-format-selected)", ff)
key('x', '[dev]fs', "<plug>(coc-format-selected)", ff)
key('n', '[dev]a', "<plug>(coc-codeaction-selected)iw", ff)
key('x', '[dev]a', "<plug>(coc-codeaction-selected)iw", ff)
key('n', '[dev]q', "<plug>(coc-fix-current)", ff)
key('n', '[dev]f', ":<c-u>Format<cr>", tf)

cmd([[hi! CocErrorSign guifg=#E82424]])
cmd([[hi! CocWarninSign guifg=#FF9E3B]])
cmd([[hi! CocInfoSign guifg=#6A9589]])
cmd([[hi! CocHSign guifg=#658594]])
