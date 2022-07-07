local g = vim.g
g.better_whitespace_enabled = 1
g.strip_whitespace_on_save = 1
g.current_line_whitespace_disabled_soft = 1
g.better_whitespace_filetypes_blacklist = { 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive' }
local key = vim.keymap.set
key('n', ']w', '<Cmd>PrevTrailingWhitespace<CR>', { noremap = true, silent = false })
