let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"

if empty(glob(s:plugvim))
    execute "!sh -c 'curl -fLo " .
        \ s:plugvim .
        \ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
    autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" https://github.com/rockerBOO/awesome-neovim
" https://zenn.dev/hituzi_no_sippo/articles/871c06cdbc45b53181e3
" TODO package manager
" https://github.com/wbthomason/packer.nvim
" TODO misc
" Plug 'glidenote/memolist.vim'
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'folke/todo-comments.nvim'
" Plug 'numToStr/Comment.nvim', { 'on': [] }
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
call plug#begin('~/.vim/plugged')
" Lua plugin
" yank
" https://github.com/bfredl/nvim-miniyank
" explore
" https://github.com/kyazdani42/nvim-tree.lua
" tabline
" https://github.com/akinsho/bufferline.nvim
" https://github.com/noib3/cokeline.nvim
" terminal
" https://github.com/akinsho/toggleterm.nvim
" starter
" Plug 'goolord/alpha-nvim'
Plug 'echasnovski/mini.nvim'
Plug 'kevinhwang91/nvim-hlslens', { 'on': [] }
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'windwp/nvim-autopairs', { 'on': [] }
Plug 'lukas-reineke/indent-blankline.nvim'

" Vim Script plugin
Plug '4513ECHO/vim-readme-viewer', { 'on': 'PlugReadme' }
Plug 'airblade/vim-rooter'
Plug 'cohama/lexima.vim', { 'on': [] }
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'haishanh/night-owl.vim'
Plug 'honza/vim-snippets'
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
Plug 'LeafCage/yankround.vim'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-sandwich'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'neoclide/coc.nvim', { 'on': [], 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/vim-precious', { 'on': [] }
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'previm/previm', { 'for': ['markdown'] }
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
Plug 'tpope/vim-fugitive', { 'on': [] }
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tyru/caw.vim', { 'on': [] }
Plug 'tyru/eskk.vim', { 'on': [] }
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja', { 'on': [] }
Plug 'vim-test/vim-test', { 'on': [] }
call plug#end()

" Load Event
augroup load_us_insert
    autocmd!
    autocmd InsertEnter * call plug#load(
                \ 'lexima.vim',
                \ 'eskk.vim',
                \ 'nvim-autopairs',
                \ )| autocmd! load_us_insert
augroup END

" Load Event
function! s:load_plug(timer)
    call plug#load(
                \ 'neoterm',
                \ 'coc.nvim',
                \ 'vim-precious',
                \ 'winresizer',
                \ 'translate.vim',
                \ 'vim-expand-region',
                \ 'vim-quickrun',
                \ 'vim-test',
                \ 'fzf.vim',
                \ 'vim-qfreplace',
                \ 'vim-fugitive',
                \ 'caw.vim',
                \ 'nvim-hlslens',
                \ 'vimdoc-ja',
                \ )
endfunction

" 500ミリ秒後にプラグインを読み込む
call timer_start(200, function("s:load_plug"))

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim
