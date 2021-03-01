let g:home = expand($HOME)
let g:config_dir = empty($XDG_CONFIG_HOME) ? g:home . "/.config" : expand($XDG_CONFIG_HOME)
let g:cache_dir = empty($XDG_CACHE_HOME) ? g:home . "/.cache" : expand($XDG_CACHE_HOME)
let s:base_dir = g:config_dir . "/nvim/config/"

" runtimepathに追加
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! search.vim
runtime! display.vim
runtime! editor.vim
runtime! keymaps.vim
runtime! language.vim
runtime! dein.vim

" runtime! userautoload/init/*.vim
" runtime! userautoload/plugins/*.vim
