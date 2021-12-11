let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"

if empty(glob(s:plugvim))
    execute "!sh -c 'curl -fLo " .
        \ s:plugvim .
        \ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
    autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

" https://github.com/rockerBOO/awesome-neovim
" https://zenn.dev/hituzi_no_sippo/articles/871c06cdbc45b53181e3
" TODO package manager
" https://github.com/wbthomason/packer.nvim
" TODO misc
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'folke/todo-comments.nvim'
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
call plug#begin('~/.vim/plugged')
" Lua plugin
" yank
" https://github.com/bfredl/nvim-miniyank
" tabline
" https://github.com/akinsho/bufferline.nvim
" https://github.com/noib3/cokeline.nvim
" terminal
" https://github.com/akinsho/toggleterm.nvim
Plug 'blackcauldron7/surround.nvim'
Plug 'echasnovski/mini.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'glidenote/memolist.vim'
Plug 'goolord/alpha-nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'ojroques/nvim-bufdel'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'

" Vim Script plugin
Plug '4513ECHO/vim-readme-viewer', { 'on': 'PlugReadme' }
Plug 'airblade/vim-rooter'
Plug 'andymass/vim-matchup'
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'haishanh/night-owl.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim', {'on': 'RainbowParentheses' }
Plug 'junegunn/vim-easy-align'
Plug 'kamykn/spelunker.vim'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'LeafCage/yankround.vim'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', { 'on': [], 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/vim-precious'
Plug 'osyo-manga/vim-textobj-blockwise'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'simeji/winresizer', { 'on': 'WinResizerStartResize' }
Plug 'skanehira/translate.vim'
Plug 't9md/vim-quickhl', { 'on': ['<plug>(quickhl-manual-this)', '<plug>(quickhl-manual-reset)'] }
Plug 'terryma/vim-expand-region', { 'on': '<plug>(expand_region_' }
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-textobj-between'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tyru/eskk.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-test/vim-test'
call plug#end()
