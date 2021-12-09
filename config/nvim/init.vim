augroup MyAutoCmd
	autocmd!
augroup end

autocmd MyAutoCmd ColorScheme * highlight Visual ctermbg=225

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
	if !isdirectory(a:dir) && (a:force ||
 			\ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
		call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
	endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

filetype plugin indent on

lua << EOF
require('core.01_basic')
require('core.02_display')
require('core.03_editor')
require('core.04_search')
require('core.05_keymaps')
EOF

runtime! init/06_plugins.vim
