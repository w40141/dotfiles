" A more adventurous wildmenu
" https://github.com/gelguy/wilder.nvim
"

" UsePlugin 'wilder.nvim'

" Default keys
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

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

" For Neovim or Vim with yarp
" For wild#cmdline_pipeline():
"   'language'   : set to 'python' to use python
"   'fuzzy'      : set fuzzy searching
" For wild#python_search_pipeline():
"   'pattern'    : can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
"   'sorter'     : omit to get results in the order they appear in the buffer
"   'engine'     : can be set to 're2' for performance, requires pyre2 to be installed
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
