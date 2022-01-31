lua << EOF
local g = vim.g
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

call plug#begin('~/.vim/plugged')
Plug '4513ECHO/vim-readme-viewer', { 'on': 'PlugReadme' }
Plug 'airblade/vim-rooter', { 'on': [] }
Plug 'akinsho/bufferline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'blackcauldron7/surround.nvim'
Plug 'deris/vim-duzzle', {'on': 'DuzzleStart'}
Plug 'famiu/bufdelete.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'honza/vim-snippets'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)'}
Plug 'kamykn/spelunker.vim', { 'on': ['<Plug>(spelunker-)', '<Plug>(undo-)', '<Plug>(add-)'] }
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lambdalisue/gina.vim', { 'on': [] }
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', { 'on': [], 'branch': 'release' }
Plug 'ntpeters/vim-better-whitespace', { 'on': 'StripWhitespace' }
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'osyo-manga/vim-precious', { 'on': [] }
Plug 'petertriho/nvim-scrollbar'
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'rebelot/kanagawa.nvim'
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'simeji/winresizer', { 'on': [] }
Plug 'skanehira/translate.vim', { 'on': ['<Plug>(Translate)', '<Plug>(VTranslate)'] }
Plug 't9md/vim-quickhl', { 'on': ['<Plug>(quickhl-manual-this)', '<Plug>(quickhl-manual-reset)'] }
Plug 'tamago324/lir.nvim'
Plug 'terryma/vim-expand-region', { 'on': '<Plug>(expand_region' }
Plug 'thinca/vim-qfreplace', { 'on': [] }
Plug 'thinca/vim-quickrun', { 'on': ['<Plug>(quickrun)'] }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'tyru/eskk.vim', { 'on': [] }
Plug 'tyru/open-browser.vim', { 'on': ['<Plug>(openbrowser-smart-search)'] }
Plug 'vim-jp/vimdoc-ja', { 'on': 'help' }
Plug 'vim-test/vim-test', { 'on': [] }

" Disable
" Plug 'folke/which-key.nvim'
" Plug 'marko-cerovac/material.nvim'
" Plug 'windwp/nvim-ts-autotag'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'VonHeikemen/fine-cmdline.nvim'
" Plug 'liuchengxu/vista.vim'
" Plug 'junegunn/fzf.vim', { 'on': [] }
" Plug 'yuki-yano/fzf-preview.vim', { 'on': [], 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
" Plug 'haishanh/night-owl.vim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'tpope/vim-fugitive', { 'on': [] }
" Plug 'glidenote/memolist.vim'
" Plug 'andymass/vim-matchup'

" fzf
" https://github.com/nvim-telescope/telescope.nvim
" TODO: misc
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" https://github.com/phaazon/hop.nvim
call plug#end()

function! s:LazyLoadPlugs(timer) abort
    call plug#load(
                \ 'vim-test',
                \ 'vim-precious',
                \ 'vim-qfreplace',
                \ 'vim-rooter',
                \ 'winresizer',
                \ 'gina.vim',
                \ 'coc.nvim',
                \ )
endfunction

call timer_start(150, function("s:LazyLoadPlugs"))

augroup load_us_insert
    autocmd!
    autocmd InsertEnter * call plug#load(
                \ 'eskk.vim',
                \ )| autocmd! load_us_insert
augroup END
