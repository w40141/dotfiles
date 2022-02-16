-- Viewer & Finder for LSP symbols and tags
-- https://github.com/liuchengxu/vista.vim

local key = vim.api.nvim_set_keymap
local g = vim.g
local cmd = vim.cmd

key('n', '<c-t>', [[:<c-u>Vista!!<cr>]], { noremap = true, silent = true })
key('n', '<leader>t', [[:<c-u>Vista finder coc<cr>]], { noremap = true, silent = true })

-- Position to open the vista sidebar. On the right by default.
-- Change to 'vertical topleft' to open on the left.
g.vista_sidebar_position = 'vertical botright'

-- Width of vista sidebar.
g.vista_sidebar_width = 30

-- Set this flag to 0 to disable echoing when the cursor moves.
g.vista_echo_cursor = 1

-- Time delay for showing detailed symbol info at current cursor.
g.vista_cursor_delay = 200

-- Close the vista window automatically close when you jump to a symbol.
g.vista_close_on_jump = 0

-- Move to the vista window when it isopened.
g.vista_stay_on_open = 1

-- Blinking cursor 2 times with 100ms interval after jumping to the tag.
g.vista_blink = { 1, 100 }

-- Executive used when opening vista sidebar without specifying it.
-- Avaliable: 'coc', 'ctags'. 'ctags' by default.
g.vista_default_executive = 'coc'

-- Declare the command including the executable and options used to
-- generate ctags output for some certain filetypes.
-- The file path will be appened to your custom command.
g.vista_ctags_cmd = {haskell='hasktags -o - -c'}

-- How each level is indented and what to prepend.
-- This could make the display more compact or more spacious.
-- e.g., more compact: ["▸ ", ""]
-- Note: this option only works for the kind renderer, not the tree renderer.
g.vista_icon_indent = { "╰─▸ ", "├─▸ " }

-- To enable fzf's preview window set g:vista_fzf_preview.
-- The elements of g:vista_fzf_preview will be passed as arguments to
-- fzf#vim#with_preview()
g.vista_fzf_preview = { 'right:50%' }

-- Ensure you have installed some decent font to show these pretty symbols,
-- then you can enable icon for the kind.
g['vista#renderer#enable_icon'] = 1

-- The default icons can't be suitable for all the filetypes,
-- you can extend it as you wish.
cmd [[
  let g:vista#renderer#icons = {
    \    'func': "\uf794",
    \    'function': "\uf794",
    \    'functions': "\uf794",
    \    'var': "\uf71b",
    \    'variable': "\uf71b",
    \    'variables': "\uf71b",
    \    'const': "\uf8ff",
    \    'constant': "\uf8ff",
    \    'constructor': "\uf976",
    \    'method': "\uf6a6",
    \    'package': "\ue612",
    \    'packages': "\ue612",
    \    'enum': "\uf702",
    \    'enummember': "\uf282",
    \    'enumerator': "\uf702",
    \    'module': "\uf136",
    \    'modules': "\uf136",
    \    'type': "\uf7fd",
    \    'typedef': "\uf7fd",
    \    'types': "\uf7fd",
    \    'field': "\uf30b",
    \    'fields': "\uf30b",
    \    'macro': "\uf8a3",
    \    'macros': "\uf8a3",
    \    'map': "\ufb44",
    \    'class': "\uf0e8",
    \    'augroup': "\ufb44",
    \    'struct': "\uf318",
    \    'union': "\ufacd",
    \    'member': "\uf02b",
    \    'target': "\uf893",
    \    'property': "\ufab6",
    \    'interface': "\uf7fe",
    \    'namespace': "\uf475",
    \    'subroutine': "\uf9af",
    \    'implementation': "\uf776",
    \    'typeParameter': "\uf278",
    \    'default': "\uf29c"
    \ }
]]
cmd([[autocmd MyAutoCmd VimEnter * call vista#RunForNearestMethodOrFunction()]])
