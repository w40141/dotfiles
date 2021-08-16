let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"

let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"
if empty(glob(s:plugvim))
      execute "!sh -c 'curl -fLo " . s:plugvim . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')
" if has('nvim')
"   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/defx.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'andymass/vim-matchup'
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
" ToDo
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-easy-align'
Plug 'LeafCage/yankround.vim'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'mechatroner/rainbow_csv'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-precious'
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'preservim/tagbar'
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'rhysd/clever-f.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
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
Plug 'unblevable/quick-scope'
Plug 'vim-jp/vimdoc-ja'
" ToDo
" Plug 'vim-test/vim-test' | Plug 'kassio/neoterm'
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'wenlongche/SrcExpl'

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
      return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim

colorscheme dracula
