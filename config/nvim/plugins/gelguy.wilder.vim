" A more adventurous wildmenu
" https://github.com/gelguy/wilder.nvim
"

UsePlugin 'wilder.nvim'

" Default keys
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

" 'file_command' : for ripgrep : ['rg', '--files']
"                : for fd      : ['fd', '-tf']
" 'dir_command'  : for fd      : ['fd', '-td']
" 'filters'      : use ['cpsm_filter'] for performance, requires cpsm vim plugin
"                  found at https://github.com/nixprime/cpsm
call wilder#set_option('pipeline', [
     \   wilder#branch(
     \     wilder#python_file_finder_pipeline({
     \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
     \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
     \       'filters': ['fuzzy_filter', 'difflib_sorter'],
     \     }),
     \     wilder#cmdline_pipeline(),
     \     wilder#python_search_pipeline(),
     \   ),
     \ ])

" Can also be passed to the 'highlights' option
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
