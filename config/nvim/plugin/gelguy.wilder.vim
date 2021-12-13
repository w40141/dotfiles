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
