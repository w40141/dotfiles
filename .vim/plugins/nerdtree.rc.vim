"---------------------------------------------------------------------------
" NERDTree.vim
"

noremap <silent><C-n> :NERDTreeToggle<CR><C-r>
let g:NERDTreeShowHidden = 1
let g:NERDTreeGlyphReadOnly = "\uF23E "
augroup MyAutoCmd
	" autocmd vimenter * nerdtree
	autocmd stdinreadpre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
