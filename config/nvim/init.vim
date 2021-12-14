lua << EOF
require('init')
EOF

let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction

autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"

if empty(glob(s:plugvim))
    execute "!sh -c 'curl -fLo " .
        \ s:plugvim .
        \ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
    autocmd MyAutoCmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" https://github.com/rockerBOO/awesome-neovim
" https://zenn.dev/hituzi_no_sippo/articles/871c06cdbc45b53181e3
" https://zenn.dev/kawarimidoll/articles/8172a4c29a6653
" TODO package manager
" https://github.com/wbthomason/packer.nvim
" fzf
" https://github.com/nvim-telescope/telescope.nvim
" TODO misc
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" https://github.com/phaazon/hop.nvim
call plug#begin('~/.vim/plugged')
Plug '4513ECHO/vim-readme-viewer', { 'on': 'PlugReadme' }
Plug 'airblade/vim-rooter'
Plug 'windwp/nvim-ts-autotag'
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'andymass/vim-matchup'
Plug 'blackcauldron7/surround.nvim'
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'echasnovski/mini.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'glidenote/memolist.vim'
Plug 'famiu/bufdelete.nvim'
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
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
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

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
