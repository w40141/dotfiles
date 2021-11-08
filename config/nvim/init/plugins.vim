let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"
if empty(glob(s:plugvim))
      execute "!sh -c 'curl -fLo " . s:plugvim . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on

call plug#begin('~/.vim/plugged')
" Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'cohama/lexima.vim'
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'haishanh/night-owl.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" TODO Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" TODO Plug 'machakann/vim-sandwich'
" TODO Plug 'lambdalisue/gina.vim'
" TODO Plug 'thinca/vim-qfreplace'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kamykn/spelunker.vim'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'LeafCage/yankround.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-precious'
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'skanehira/translate.vim'
Plug 't9md/vim-quickhl'
Plug 'terryma/vim-expand-region'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-textobj-between'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'troydm/easybuffer.vim', { 'on': 'EasyBuffer' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tyru/caw.vim'
Plug 'tyru/eskk.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-test/vim-test'
Plug 'Yggdroot/indentLine'
call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
      return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim
