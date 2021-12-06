let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"
if empty(glob(s:plugvim))
    execute "!sh -c 'curl -fLo " .
        \ s:plugvim .
        \ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
    autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on

" https://github.com/rockerBOO/awesome-neovim
call plug#begin('~/.vim/plugged')
" TODO terminal
" https://github.com/rockerBOO/awesome-neovim#terminal-integration
" TODO statuline
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'datwaft/bubbly.nvim'
Plug 'NTBBloodbath/galaxyline.nvim'
" TODO package manager
" https://github.com/wbthomason/packer.nvim
" TODO other
" https://github.com/wbthomason/packer.vim
" Plug 'glidenote/memolist.vim'
" https://github.com/MattesGroeger/vim-bookmarks
" Plug 'MattesGroeger/vim-bookmarks'
" https://github.com/nvim-lua/plenary.nvim
" Plug 'nvim-lua/plenary.nvim'
" https://github.com/folke/todo-comments.nvim
" Plug 'folke/todo-comments.nvim'
" TODO fizzy finder
" https://github.com/nvim-telescope/telescope.nvim
Plug '4513ECHO/vim-readme-viewer', { 'on': 'PlugReadme' }
Plug 'airblade/vim-gitgutter', { 'on': [] }
Plug 'airblade/vim-rooter'
Plug 'cohama/lexima.vim', { 'on': [] }
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'echasnovski/mini.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'haishanh/night-owl.vim'
Plug 'honza/vim-snippets'
" Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'on': [] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses' }
Plug 'junegunn/vim-easy-align'
Plug 'kamykn/spelunker.vim'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm', { 'on': [] }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'kyazdani42/nvim-web-devicons', { 'on': [] }
Plug 'LeafCage/yankround.vim'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', { 'on': [], 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-precious', { 'on': [] }
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'previm/previm', { 'for': ['markdown'] }
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'simeji/winresizer', { 'on': 'WinResizerStartResize' }
Plug 'skanehira/translate.vim', { 'on': [] }
Plug 't9md/vim-quickhl', { 'on': ['<plug>(quickhl-manual-this)', '<plug>(quickhl-manual-reset)'] }
Plug 'terryma/vim-expand-region', { 'on': '<plug>(expand_region_' }
Plug 'thinca/vim-qfreplace', { 'on': [] }
Plug 'thinca/vim-quickrun', { 'on': [] }
Plug 'thinca/vim-textobj-between'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
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
                \ 'neoterm',
                \ 'coc.nvim',
                \ 'vim-precious',
                \ 'nvim-web-devicons',
                \ 'winresizer',
                \ 'translate.vim',
                \ 'vim-expand-region',
                \ 'vim-quickrun',
                \ 'vim-test',
                \ 'fzf.vim',
                \ 'vim-qfreplace',
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
