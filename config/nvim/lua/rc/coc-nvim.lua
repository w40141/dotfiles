-- LSP Complement
-- https://github.com/neoclide/coc.nvim
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api
local key = vim.keymap.set
local bo = vim.bo
local opt = vim.opt
local o = vim.o

-- Highlight the symbol and its references when holding the cursor.
api.nvim_create_augroup("CocGroup", {})
api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold"
})

-- Setup formatexpr specified filetype(s).
api.nvim_create_autocmd("FileType", {
  group = "CocGroup",
  pattern = "typescript,json",
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
api.nvim_create_autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder"
})

opt.shell = '/bin/zsh'
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
  "coc-yaml",

}

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
-- g['coc_snippet_next'] = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
-- g['coc_snippet_prev'] = '<c-k>'

-- Use K to show documentation in preview window.
function _G.show_docs()
  local cw = fn.expand('<cword>')
  if fn.index({ 'vim', 'help' }, bo.filetype) >= 0 then
    api.nvim_command('h ' .. cw)
  elseif api.nvim_eval('coc#rpc#ready()') then
    fn.CocActionAsync('doHover')
  else
    api.nvim_command('!' .. o.keywordprg .. ' ' .. cw)
  end
end

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
-- keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
-- keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
-- keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
-- keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
-- keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
-- keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
-- keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
-- keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)

-- Add `:Format` command to format current buffer.
api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer.
api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

function _G.check_back_space()
  local col = fn.col(".") - 1
  return col == 0 or fn.getline("."):sub(col, col):match("%s")
end

local ttt = { expr = true, noremap = true, silent = true, replace_keycodes = false }
key("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', ttt)
key('i', '<s-tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"]], ttt)
-- key('i', '<cr>', [[coc#pum#visible() ? coc#_select_confirm() : "\<CR>"]], ttt)
key("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], ttt)

local ff = { noremap = false, silent = false }
local tf = { noremap = true, silent = false }
key('i', '<c-l>', "<plug>(coc-snippets-expand)", ff)
key('v', '<c-j>', "<plug>(coc-snippets-select)", ff)
key('i', '<c-j>', "<plug>(coc-snippets-expand-jump)", ff)
key('x', '[dev]x', "<plug>(coc-convert-snippet)", tf)
key('i', '<c-@>', "coc#refresh", tf)
key('n', 'H', "<CMD>lua _G.show_docs()<CR>", { silent = true })
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
key("n", "[dev]cl", "<Plug>(coc-codelens-action)", ff)
key('n', '[dev]q', "<plug>(coc-fix-current)", ff)
key('n', '[dev]f', ":<c-u>Format<cr>", tf)

-- Remap <C-f> and <C-b> for scroll float windows/popups.
-- key("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', ttt)
-- key("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', ttt)
-- key("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', ttt)
-- key("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', ttt)
-- key("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', ttt)
-- key("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', ttt)

cmd([[hi! CocErrorSign guifg=#E82424]])
cmd([[hi! CocWarninSign guifg=#FF9E3B]])
cmd([[hi! CocInfoSign guifg=#6A9589]])
cmd([[hi! CocHSign guifg=#658594]])
