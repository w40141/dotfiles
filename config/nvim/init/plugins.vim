" dein settings
let g:home = expand($HOME)
let g:config_dir = empty($XDG_CONFIG_HOME) ? g:home . "/.config" : expand($XDG_CONFIG_HOME)
if has('nvim')
  let g:python3_host_prog = g:config_dir . "/nvim/neovim3/.venv/bin/python"
endif

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
      \ Plug 'ryanoasis/vim-devicons'|
      \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'airblade/vim-gitgutter'

Plug 'vimtaku/hl_matchit.vim'

Plug 'honza/vim-snippets'

Plug 'majutsushi/tagbar'

Plug 'itchyny/vim-parenmatch'

Plug 'itchyny/vim-cursorword'

Plug 'andymass/vim-matchup'

Plug 'vim-jp/vimdoc-ja'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'rhysd/vim-operator-surround' |
      \ Plug 'kana/vim-operator-user' |
      \ Plug 'osyo-manga/vim-textobj-multiblock' |
      \ Plug 'kana/vim-textobj-user'

Plug 'sheerun/vim-polyglot'

Plug 'Shougo/context_filetype.vim' | Plug 'osyo-manga/vim-precious'

Plug 'tpope/vim-repeat', { 'on': ['FocusLost', 'CursorHold'] }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'jiangmiao/auto-pairs'

Plug 'tyru/caw.vim'

Plug 'mileszs/ack.vim'

Plug 'skanehira/translate.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'deris/vim-gothrough-jk'

Plug 'tyru/open-browser.vim'

Plug 'AndrewRadev/switch.vim', { 'on': 'Switch' }

Plug 'LeafCage/yankround.vim'

Plug 'osyo-manga/vim-anzu'

Plug 't9md/vim-quickhl'

Plug 'troydm/easybuffer.vim', { 'on': 'EasyBuffer' }

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'thinca/vim-quickrun'

Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

Plug 'mattn/gist-vim', { 'on': 'Gist' } | Plug 'mattn/webapi-vim'

Plug 'gregsexton/gitv', { 'on': 'Gitv' } | Plug 'tpope/vim-fugitive'

Plug 'reireias/vim-cheatsheet', { 'on': 'Cheat' }

Plug 'previm/previm', { 'for': 'markdown' }

Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown', 'txt'] }

Plug 'mattn/emmet-vim', { 'for': ['html', 'html5'] }

Plug 'terryma/vim-expand-region'

Plug 'lervag/vimtex', { 'for': 'tex' }

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! plugins/*.vim

" gundo.vim
nnoremap <Leader>g :GundoToggle<CR>

" quickrun
nmap <Leader>qr <Plug>(quickrun)
let g:quickrun_config = {'*': {'runner': 'remote/vimproc'}, }
let g:quickrun_config={'*': {'split': 'vertical'}}
set splitright

"easybuffer
nnoremap buf :<C-u>EasyBuffer<CR>

" vim-cheatsheet
let g:cheatsheet#cheat_file = '$HOME/.config/nvim/plugins/util/cheatsheet.md'

" previm
let g:previm_open_cmd = 'open -a Google\ Chrome'
nnoremap <silent> <Leader><Leader>o :PrevimOpen<CR>
let g:previm_enable_realtime = 1

" vim-table-mode
let g:table_mode_corner = '|'

" vim-expand-region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" vim-operator-surround
" saiw(
nmap <silent>sa <Plug>(operator-surround-append)
" sda(
nmap <silent>sd <Plug>(operator-surround-delete)
" sra"'
nmap <silent>sr <Plug>(operator-surround-replace)
" カーソル位置から一番近い括弧を削除する
nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" " カーソル位置から一番近い括弧を変更する
nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" vim-anzu
nmap n n<Plug>(anzu-update-search-status)
nmap N N<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <C-c><C-c> <C-h><C-h><Plug>(anzu-clear-search-status)

" yankround.vim
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap yp <Plug>(yankround-prev)
nmap yn <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-c> :<C-u>CtrlPYankRound<CR>

" open-browser.vim
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-gothrought-jk
nmap ,j  <Plug>(gothrough-jk-j)
nmap ,k  <Plug>(gothrough-jk-k)
nmap ,gj <Plug>(gothrough-jk-gj)
nmap ,gk <Plug>(gothrough-jk-gk)

" vim-polyglot
" let g:polyglot_disabled = ['latex']

" vim-markdown
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_style_pythonic = 1

" auto-pairs
let g:AutoPairsMapCh = 0

" vim-matchup
let g:loaded_matchit = 1

" vim-parenmatch
let g:loaded_matchparen = 1

" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➤'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = "➜"
let g:gitgutter_highlight_lines = 0

colorscheme dracula
