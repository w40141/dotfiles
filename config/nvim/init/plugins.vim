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

" Add Icons
Plug 'ryanoasis/vim-devicons'

" Filer
Plug 'preservim/nerdtree'
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

" Syntax Highlight
Plug 'sheerun/vim-polyglot'

" Switch FileType
Plug 'osyo-manga/vim-precious'
                  \ | Plug 'Shougo/context_filetype.vim'

" Create your own text objects
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'thinca/vim-textobj-between'
Plug 'osyo-manga/vim-textobj-blockwise'

" Define your own operator
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-operator-replace'

" 
" Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }

" Use register history
Plug 'LeafCage/yankround.vim'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Translate Language
Plug 'skanehira/translate.vim'

" LSP Complement
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
                  \ | Plug 'honza/vim-snippets'

" Open url with a browser
Plug 'tyru/open-browser.vim'

" Plug 'easymotion/vim-easymotion'

" Highlight the word under the cursor
Plug 't9md/vim-quickhl'

" Select increasingly larger regions of text
Plug 'terryma/vim-expand-region'

" Display buffers
Plug 'troydm/easybuffer.vim', { 'on': 'EasyBuffer' }

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'thinca/vim-quickrun'

" Browse the tags of the current file
Plug 'majutsushi/tagbar'

" Preview for markdown
Plug 'previm/previm', { 'for': ['markdown'] }

" Automatic table creator & formatter
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'txt'] }

" FileType & syntax plugin for LaTeX
Plug 'lervag/vimtex', { 'for': ['tex'] }

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
      return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim

colorscheme dracula
