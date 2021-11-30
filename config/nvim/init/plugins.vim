let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"
if empty(glob(s:plugvim))
      execute "!sh -c 'curl -fLo " . s:plugvim . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter', { 'on': [] }
Plug 'airblade/vim-rooter'
Plug 'cohama/lexima.vim', { 'on': [] }
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'haishanh/night-owl.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'on': [], 'do': { -> fzf#install() } }
" TODO Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" TODO Plug 'machakann/vim-sandwich'
" TODO Plug 'lambdalisue/gina.vim'
" TODO Plug 'thinca/vim-qfreplace'
Plug 'junegunn/fzf.vim', { 'on': [] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses'}
Plug 'junegunn/vim-easy-align'
Plug 'kamykn/spelunker.vim'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm', { 'on': [] }
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kristijanhusak/defx-git', { 'on': [] }
Plug 'kristijanhusak/defx-icons', { 'on': [] }
Plug 'LeafCage/yankround.vim'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-precious', { 'on': [] }
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'ryanoasis/vim-devicons', { 'on': [] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'simeji/winresizer'
Plug 'skanehira/translate.vim'
Plug 't9md/vim-quickhl'
Plug 'terryma/vim-expand-region'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-textobj-between'
Plug 'tpope/vim-fugitive', { 'on': [] }
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }
Plug 'tpope/vim-surround', { 'on': [] }
Plug 'tpope/vim-unimpaired', { 'on': [] }
Plug 'troydm/easybuffer.vim', { 'on': 'EasyBuffer' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tyru/caw.vim', { 'on': [] }
Plug 'tyru/eskk.vim', { 'on': [] }
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-test/vim-test', { 'on': [] }
Plug 'Yggdroot/indentLine'
call plug#end()

" Load Event
augroup load_us_insert
    autocmd!
    autocmd InsertEnter * call plug#load(
                \ 'lexima.vim',
                \ 'eskk.vim',
                \ )| autocmd! load_us_insert
augroup END

" Load Event
function! s:load_plug(timer)
    call plug#load(
                \ 'vim-gitgutter',
                \ 'fzf',
                \ 'fzf.vim',
                \ 'neoterm',
                \ 'defx-git',
                \ 'defx-icons',
                \ 'vim-precious',
                \ 'vim-devicons',
                \ 'vim-unimpaired',
                \ 'vim-fugitive',
                \ 'vim-surround',
                \ 'vim-unimpaired',
                \ 'caw.vim',
                \ 'vim-test',
                \ )
endfunction

" 500ミリ秒後にプラグインを読み込む
call timer_start(300, function("s:load_plug"))

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
      return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim
