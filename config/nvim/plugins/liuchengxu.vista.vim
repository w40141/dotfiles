" Viewer & Finder for LSP symbols and tags
" https://github.com/liuchengxu/vista.vim

UsePlugin 'vista.vim'

nnoremap <silent> <C-t> :<C-U>Vista!!<CR>
nnoremap <silent> <leader>t :<C-U>Vista finder coc<CR>

" Position to open the vista sidebar. On the right by default.
" Change to 'vertical topleft' to open on the left.
let g:vista_sidebar_position = 'vertical botright'

" Width of vista sidebar.
let g:vista_sidebar_width = 30

" Set this flag to 0 to disable echoing when the cursor moves.
let g:vista_echo_cursor = 1

" Time delay for showing detailed symbol info at current cursor.
let g:vista_cursor_delay = 200

" Close the vista window automatically close when you jump to a symbol.
let g:vista_close_on_jump = 0

" Move to the vista window when it is opened.
let g:vista_stay_on_open = 1

" Blinking cursor 2 times with 100ms interval after jumping to the tag.
let g:vista_blink = [1, 100]

" Executive used when opening vista sidebar without specifying it.
" Avaliable: 'coc', 'ctags'. 'ctags' by default.
let g:vista_default_executive = 'coc'

" Declare the command including the executable and options used to
" generate ctags output for some certain filetypes.
" The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -o - -c',
      \ }

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to
" fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols,
" then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes,
" you can extend it as you wish.
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
