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
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'itchyny/vim-cursorword'
Plug 'andymass/vim-matchup'
Plug 'vim-jp/vimdoc-ja'
Plug 'tyru/caw.vim'
Plug 'sheerun/vim-polyglot'
Plug 'osyo-manga/vim-precious'
Plug 'Shougo/context_filetype.vim'
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'thinca/vim-textobj-between'
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'LeafCage/yankround.vim'
Plug 'skanehira/translate.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'skanehira/translate.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
Plug 'tyru/open-browser.vim'
Plug 't9md/vim-quickhl'
Plug 'terryma/vim-expand-region'
Plug 'troydm/easybuffer.vim', { 'on': 'EasyBuffer' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'thinca/vim-quickrun'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'wenlongche/SrcExpl'
Plug 'mkalinski/vim-lightline_tagbar' | Plug 'preservim/tagbar'
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'txt'] }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'tyru/eskk.vim'
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'tpope/vim-endwise'
Plug 'mechatroner/rainbow_csv'
" https://wonderwall.hatenablog.com/entry/2017/10/07/220000
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" https://qiita.com/arwtyxouymz0110/items/b09ef1ed7a2f7bf1c5e6
" Plug 'rhysd/clever-f.vim'
" Plug 'unblevable/quick-scope'
" Plug 'vim-test/vim-test'

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
      return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim

colorscheme dracula
