local f = vim.fn

local wilder = require('wilder')
wilder.setup({
    modes = {':', '/', '?'},
    next_key='<Tab>',
    previous_key= '<S-Tab>',
    accept_key = '<Down>',
    reject_key = '<Up>',
})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.python_file_finder_pipeline({
      -- to use ripgrep : {'rg', '--files'}
      -- to use fd      : {'fd', '-tf'}
      file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'}, 
      -- to use fd      : {'fd', '-td'}
      dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
      -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
      -- found at https://github.com/nixprime/cpsm
      filters = {'fuzzy_filter', 'difflib_sorter'},
    }),
    wilder.cmdline_pipeline(),
    wilder.python_search_pipeline()
  ),
})

wilder.set_option('renderer', wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    highlights = {
        accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
    },
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
}))

-- vim.cmd([[
-- call wilder#set_option('renderer', wilder#popupmenu_renderer({
--             \ 'highlighter': wilder#basic_highlighter(),
--             \ 'highlights': {
--             \ 'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
--             \ },
--             \ 'left': [
--             \ ' ', wilder#popupmenu_devicons(),
--             \ ],
--             \ 'right': [
--             \ ' ', wilder#popupmenu_scrollbar(),
--             \ ],
--             \ }))
-- ]])

-- vim.cmd([[
-- call wilder#set_option('pipeline', [
--       \   wilder#branch(
--       \     wilder#cmdline_pipeline({
--       \       'language': 'python',
--       \       'fuzzy': 1,
--       \     }),
--       \     wilder#python_search_pipeline({
--       \       'pattern': wilder#python_fuzzy_pattern(),
--       \       'sorter': wilder#python_difflib_sorter(),
--       \       'engine': 're',
--       \     }),
--       \   ),
--       \ ])
--     \
-- ]])
