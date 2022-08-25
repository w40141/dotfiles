-- LSP Complement
-- https://github.com/neoclide/coc.nvim
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn

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

vim.opt.shell = '/bin/zsh'
cmd([[let $SHELL = "/bin/zsh"]])

g['coc_global_extensions'] = {
    "coc-css",
    "coc-dictionary",
    "coc-docker",
    "coc-elixir",
    "coc-eslint",
    "coc-fish",
    "coc-git",
    "coc-gitignore",
    "coc-go",
    "coc-graphql",
    "coc-html",
    "coc-java",
    "coc-java-debug",
    "coc-json",
    "coc-kotlin",
    "coc-markdownlint",
    "coc-pairs",
    "coc-prettier",
    "coc-prisma",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    "coc-spell-checker",
    "coc-sql",
    "coc-sumneko-lua",
    "coc-texlab",
    "coc-toml",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-word",
    "coc-yaml"
}

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
g['coc_snippet_next'] = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
g['coc_snippet_prev'] = '<c-k>'

function _G.check_back_space()
    local col = fn.col(".") - 1
    if col == 0 or fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

local key = vim.keymap.set
local ttt = { expr = true, noremap = true, silent = true }
key('i', '<tab>', [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "\<TAB>" : coc#refresh()]], ttt)
key('i', '<s-tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"]], ttt)
key('i', '<cr>', [[coc#pum#visible() ? coc#_select_confirm() : "\<CR>"]], ttt)

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
key('x', '[dev]ac', "<plug>(coc-codeaction)", ff)
key('n', '[dev]a', "<plug>(coc-codeaction-selected)iw", ff)
key('x', '[dev]a', "<plug>(coc-codeaction-selected)iw", ff)
key('n', '[dev]q', "<plug>(coc-fix-current)", ff)
key('n', '[dev]f', ":<c-u>Format<cr>", tf)

cmd([[hi! CocErrorSign guifg=#E82424]])
cmd([[hi! CocWarninSign guifg=#FF9E3B]])
cmd([[hi! CocInfoSign guifg=#6A9589]])
cmd([[hi! CocHSign guifg=#658594]])
