UsePlugin 'nerdtree'

nnoremap <silent><C-e> :<C-u>NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeGlyphReadOnly = "\uF23E "
augroup MyAutoCmd
  autocmd bufenter * if (winnr("$") == 1
        \ && exists("b:NERDTree")
        \ && b:NERDTree.isTabTree()) | q | endif
augroup END

let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  : '✹',
			\ 'Staged'    : '✚',
    	\ 'Untracked' : '✭',
    	\ 'Renamed'   : '➜',
    	\ 'Unmerged'  : '═',
    	\ 'Deleted'   : '✖',
    	\ 'Dirty'     : '✗',
    	\ 'Clean'     : '✔︎',
    	\ 'Ignored'   : '☒',
    	\ 'Unknown'   : '?',
			\ }
