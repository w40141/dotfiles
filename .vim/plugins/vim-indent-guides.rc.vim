"---------------------------------------------------------------------------
" ale.vim
"

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
let g:indent_guides_auto_colors = 0
augroup MyAutoCmd
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
augroup END
