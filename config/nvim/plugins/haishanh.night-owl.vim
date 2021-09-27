" A 24bit dark Vim colorscheme based on sdras/night-owl-vscode-theme
" https://github.com/haishanh/night-owl.vim

UsePlugin 'night-owl.vim'

if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme

syntax enable
colorscheme night-owl
