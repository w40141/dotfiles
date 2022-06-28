-- A more adventurous wildmenu
-- https://github.com/gelguy/wilder.nvim

local f = vim.fn

f['wilder#setup'](
    {
        modes = {':', '/', '?'},
        next_key='<Tab>',
        previous_key= '<S-Tab>',
        accept_key = '<Down>',
        reject_key = '<Up>',
    }
)

vim.cmd([[
call wilder#set_option('renderer', wilder#popupmenu_renderer({
            \ 'highlighter': wilder#basic_highlighter(),
            \ 'highlights': {
            \ 'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
            \ },
            \ 'left': [
            \ ' ', wilder#popupmenu_devicons(),
            \ ],
            \ 'right': [
            \ ' ', wilder#popupmenu_scrollbar(),
            \ ],
            \ }))
]])

vim.cmd([[
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
    \
]])

-- f['wilder#set_option']('renderer', f['wilder#popupmenu_renderer']({
--     highlighter = f['wilder#basic_highlighter'](),
--     highlights = {
--         accent = f['wilder#make_hl']('WilderAccent', 'Pmenu', {{}, {}, {foreground = '#f4468f'}}),
--     },
--     left = {
--         ' ', f['wilder#popupmenu_devicons'](),
--     },
--     right = {
--         ' ', f['wilder#popupmenu_scrollbar'](),
--     },
-- }))

-- f['wilder#set_option']('pipeline', {
--     f['wilder#branch']({
--         f['wilder#cmdline_pipeline']({
--             language = 'python',
--             fuzzy = 1,
--         }),
--         f['wilder#python_search_pipeline']({
--             pattern = f['wilder#python_fuzzy_pattern'](),
--             sorter = f['wilder#python_difflib_sorter'](),
--             engine = 're',
--         })
--     })
-- })
