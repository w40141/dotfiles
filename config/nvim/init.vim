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
call plug#begin('~/.vim/plugged')
" Lua
Plug 'nvim-lualine/lualine.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'blackcauldron7/surround.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'lewis6991/gitsigns.nvim'
" TODO 設定周りを確認する
Plug 'nvim-treesitter/nvim-treesitter'
" TODO textobj周りを確認する
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'tamago324/lir.nvim'

" https://github.com/rockerBOO/awesome-neovim#colorscheme
Plug 'marko-cerovac/material.nvim'

Plug 'folke/todo-comments.nvim'

" Disable
" Plug 'windwp/nvim-ts-autotag'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'VonHeikemen/fine-cmdline.nvim'

" VimScript
Plug 'ntpeters/vim-better-whitespace', { 'on': 'StripWhitespace' }
Plug 'itchyny/vim-cursorword'
Plug 'skanehira/translate.vim', { 'on': ['<plug>(Translate)', '<plug>(VTranslate)'] }
Plug 'tyru/open-browser.vim', { 'on': ['<plug>(openbrowser-smart-search)'] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'vim-jp/vimdoc-ja', { 'on': 'help' }
Plug 'kana/vim-operator-user', { 'on': [] }
Plug 'kana/vim-operator-replace', { 'on': '<plug>(operator-replace)' }
Plug 'kana/vim-textobj-user', { 'on': [] }
Plug 'osyo-manga/vim-textobj-blockwise', { 'on': [] }
Plug 'osyo-manga/vim-textobj-multiblock', { 'on': '<plug>(textobj-multiblock)' }
Plug 'thinca/vim-textobj-between', { 'on': '<plug>(textobj-between' }
Plug 'terryma/vim-expand-region', { 'on': '<plug>(expand_region' }
Plug 'sgur/vim-textobj-parameter', { 'on': '<plug>(textobj-parameter)' }
Plug '4513ECHO/vim-readme-viewer', { 'on': 'PlugReadme' }
Plug 'kamykn/spelunker.vim', { 'on': ['<plug>(spelunker-)', '<plug>(undo-)', '<plug>(add-)'] }
Plug 'thinca/vim-quickrun', { 'on': ['<plug>(quickrun)'] }
Plug 'junegunn/vim-easy-align', { 'on': '<plug>(EasyAlign)'}
Plug 't9md/vim-quickhl', { 'on': ['<plug>(quickhl-manual-this)', '<plug>(quickhl-manual-reset)'] }
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'simeji/winresizer', { 'on': [] }
Plug 'vim-test/vim-test', { 'on': [] }
Plug 'tyru/eskk.vim', { 'on': [] }
Plug 'osyo-manga/vim-precious', { 'on': [] }
Plug 'thinca/vim-qfreplace', { 'on': [] }
Plug 'airblade/vim-rooter', { 'on': [] }
Plug 'honza/vim-snippets'
" TODO vim to lua
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" TODO vim to lua
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" TODO vim to lua
" TODO vim to lua
Plug 'neoclide/coc.nvim', { 'on': [], 'branch': 'release' }
Plug 'lambdalisue/gina.vim', { 'on': [] }

" Disable
" Plug 'junegunn/fzf.vim', { 'on': [] }
" Plug 'yuki-yano/fzf-preview.vim', { 'on': [], 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
" Plug 'haishanh/night-owl.vim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'tpope/vim-fugitive', { 'on': [] }
" Plug 'liuchengxu/vista.vim'
" Plug 'glidenote/memolist.vim'
" Plug 'andymass/vim-matchup'
call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

function! s:LazyLoadPlugs(timer) abort
    call plug#load(
                \ 'vim-operator-user',
                \ 'vim-textobj-user',
                \ 'vim-textobj-blockwise',
                \ 'vim-test',
                \ 'vim-precious',
                \ 'vim-precious',
                \ 'vim-qfreplace',
                \ 'vim-rooter',
                \ 'winresizer',
                \ 'gina.vim',
                \ 'coc.nvim',
                \ )

endfunction
call timer_start(200, function("s:LazyLoadPlugs"))

augroup load_us_insert
    autocmd!
    autocmd InsertEnter * call plug#load(
                \ 'eskk.vim',
                \ )| autocmd! load_us_insert
augroup END

" https://github.com/rockerBOO/awesome-neovim
" https://zenn.dev/hituzi_no_sippo/articles/871c06cdbc45b53181e3
" https://zenn.dev/kawarimidoll/articles/8172a4c29a6653
" https://zenn.dev/monaqa/articles/2020-12-22-vim-abbrev
" https://qiita.com/pink_bangbi/items/8d9041bb6bc3473dbd20
" https://zenn.dev/tamago324/articles/2021-12-16-lir-nvim-introduction
" fzf
" https://github.com/nvim-telescope/telescope.nvim
" TODO misc
" https://github.com/vim-skk/skkeleton
" https://github.com/mopp/vim-operator-convert-case
" https://github.com/folke/which-key.nvim
" https://github.com/VonHeikemen/fine-cmdline.nvim
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" https://github.com/phaazon/hop.nvim
