let g:config_dir = empty($XDG_CONFIG_HOME) ? expand($HOME) . "/.config" : expand($XDG_CONFIG_HOME)
let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"

let s:plugvim  = expand($XDG_DATA_HOME) . "/nvim/site/autoload/plug.vim"
if empty(glob(s:plugvim))
      execute "!sh -c 'curl -fLo " . s:plugvim .
                        \ " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorsheme
Plug 'dracula/vim', { 'as': 'dracula' }

" PowerLine
Plug 'itchyny/lightline.vim'

" Popup the number of search results 
Plug 'osyo-manga/vim-anzu'
" Plug 'obcat/vim-hitspop'

"Plug 'glepnir/indent-guides.nvim'

" Add Icons
Plug 'ryanoasis/vim-devicons'

" Filer
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
                  \ | Plug 'Xuyuanp/nerdtree-git-plugin'
                  \ | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Show a git diff
Plug 'airblade/vim-gitgutter'

" Execute git commands from vim 
Plug 'tpope/vim-fugitive'

" Cheatsheet for neovim's config
Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }

" Underlines the word under the cursor
Plug 'itchyny/vim-cursorword'

" Highlight, navigate, and operate on sets of matching text
Plug 'andymass/vim-matchup'

" Japanese Help
Plug 'vim-jp/vimdoc-ja'

" Comment Out
Plug 'tyru/caw.vim'
" Plug 'glepnir/prodoc.nvim'

" Syntax Highlight
Plug 'sheerun/vim-polyglot'

" Switch FileType
Plug 'osyo-manga/vim-precious'
                  \ | Plug 'Shougo/context_filetype.vim'

" This is a requirement, which implements some useful window management items for neovim
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/popup.nvim'

" Create your own text objects
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'thinca/vim-textobj-between'
Plug 'osyo-manga/vim-textobj-blockwise'

" Define your own operator
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
" Plug 'rhysd/vim-operator-surround'

" Use register history
Plug 'LeafCage/yankround.vim'

Plug 'skanehira/translate.vim'
Plug 'skanehira/translate.vim'
Plug 'skanehira/translate.vim'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Translate Language
Plug 'skanehira/translate.vim'

" LSP Complement
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
                  \ | Plug 'honza/vim-snippets'

" Open url with a browser
Plug 'tyru/open-browser.vim'

" Highlight the word under the cursor
Plug 't9md/vim-quickhl'

" Select increasingly larger regions of text
Plug 'terryma/vim-expand-region'

" Display buffers
Plug 'troydm/easybuffer.vim', { 'on': 'EasyBuffer' }

" Asynchronous execution library
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Run a command and show its result quickly
Plug 'thinca/vim-quickrun'

" Browse the tags of the current file
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

" Preview for markdown
Plug 'previm/previm', { 'for': ['markdown'] }

" Get an averaged startup profile
Plug 'tweekmonster/startuptime.vim', {'on': 'StartupTime'}

" Automatic table creator & formatter
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'txt'] }

" FileType & syntax plugin for LaTeX
Plug 'lervag/vimtex', { 'for': ['tex'] }

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }

" Delete, change, and add surroudings in pairs
Plug 'tpope/vim-surround'

" Motion on speed
" Plug 'easymotion/vim-easymotion'

Plug 'mileszs/ack.vim'

" Visualize your vim undo tree
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
      return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim

filetype plugin indent on
syntax on
colorscheme dracula
