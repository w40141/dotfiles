let s:base_dir = expand('$XDG_CONFIG_HOME/nvim/config/')

" runtimepathに追加
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! search.vim
runtime! display.vim
runtime! editor.vim
runtime! keymaps.vim
runtime! language.vim
runtime! dein.vim
