"--------------------
" 基本的な設定
"--------------------

"{{{
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

" 256色設定にする
set t_Co=256

" vi互換をオフする
set nocompatible

" OS判定フラグ
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \ || (!executable('xdg-open') && system('uname') =~? '^darwin'))

" エンコード
if s:is_windows
  " For Windows.
  language messages ja_JP
elseif s:is_mac
  " For Mac.
  language messages ja_JP.UTF-8
  language ctype ja_JP.UTF-8
  language time ja_JP.UTF-8
else
  " For Linux.
  language messages C
endif

" SSH クライアントの設定によってはマウスが使える
set mouse=n

" 全モードでマウスを有効化
set mouse=a

" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

" 内容が変更されたら自動的に再読み込み
set autoread

" クリップボードをWindowsと連携する
set clipboard=unnamed

" ビープ音すべてを無効にする
set visualbell t_vb=

"エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" backup(~/.vim/backup)
set backup
set backupdir=~/.vim/backup
set noswapfile
set viminfo+=n~/.vim/.viminfo

" <Leader>キーを変更 (default: \)
" <LocalLeader>キーを変更
let g:mapleader=','
"}}}

"--------------------
" 検索設定
"--------------------

"{{{
" 検索時に大/小を区別しない
set ignorecase

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" 検索時にマッチした単語をハイライトにする
set hlsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" インクリメンタルサーチを行う
set incsearch

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
"}}}

"--------------------
" 表示設定
"--------------------

"{{{
" 不可視文字を表示
set list

" 行番号を表示する
set number

" タイトルをウィンドウ枠に表示する
set title

" ウィンドウ幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 新しい行のインデントを現在行と同じにする
set autoindent

"オートインデント
set smartcase

" コマンド行の長さ
set cmdheight=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set laststatus=2

" ステータスラインにコマンドを表示
set showcmd

" ステータスラインの色
highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

" ルーラー(右下に行・列)を表示
set ruler

"999 行, 888 文字" の代わりに "999L, 888C" を表示。
set shortmess+=I

" カーソル行をハイライト
set cursorline

"カレントウィンドウのみにカーソル行をハイライト
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" 新しい行を作った時に高度な自動インデントを行う
set smarttab

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell
"}}}

"--------------------
" 編集設定
"--------------------

"{{{
" 折りたたみ機能を使う
set foldenable
set foldmethod=marker
" set foldmethod=indent
set foldcolumn=1

"deleteでインデントを削除可能にする
set backspace=indent,eol,start

" 閉括弧が入力された時、対応する括弧を強調する
set showmatch

" 閉括弧が入力された時対応する括弧に一時的に移動
set nostartofline

" コマンドライン履歴保存
set history=10000

" vimのコマンドライン補完
set wildmenu

" vimのコマンドライン
set wildmode=longest:full,full

" カーソルを行頭、行末で止まらないようにする
set whichwrap+=b,s,h,l,<,>,[,]

" カーソルを常に画面の中央に表示させる
set scrolloff=999

" 改行後にdeleteで上行末尾の一文字を消す
set backspace=2

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

" tabとspaceの混在を防ぐ
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,

" ペーストモード
set pastetoggle=<C-E>

" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen

" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround

" 補完時に大文字小文字を区別しない
set infercase

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus,unnamed
else
  set clipboard& clipboard+=unnamed
endif
"}}}

"--------------------
" タブ設定
"--------------------

"{{{
" タブの代わりに空白文字を指定する
set expandtab

" C言語のインデントに従って自動インデントを行う
set cindent

" 行頭での<tab>の幅
set shiftwidth=4 tabstop=4 softtabstop=4

" vim の言語別設定
" autocmd! FileType <language> setlocal shiftwidth=? tabstop=? softtabstop=?
augroup vimrc
  autocmd!
  " typescript
  autocmd BufRead,BufNewFile *.ts setl filetype=typescript
  " less
  autocmd BufRead,BufNewFile *.less setl filetype=less
  " applescript
  autocmd BufRead,BufNewFile *.applescript,*.scpt setl filetype=applescript
  autocmd FileType applescript inoremap <buffer> <S-CR>  ￢<CR>
  " markdown
  autocmd BufRead,BufNewFile *.md setl filetype=markdown

  " Rakefile
  autocmd BufNewfile,BufRead Rakefile foldmethod=syntax foldnestmax=1


  autocmd FileType ref nnoremap <buffer> <TAB> <C-w>w

  " ファイル書き込み時に再度 filetype 判定
  autocmd BufWritePost *
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif

  " Improved include pattern.
  autocmd FileType html
        \ setlocal includeexpr=substitute(v:fname,'^\\/','','') |
        \ setlocal path+=./;/
  autocmd FileType php setlocal path+=/usr/local/share/pear
  autocmd FileType apache setlocal path+=./;/

  " Set sw/sts/ts.
  " sw  : shiftwidth (インデント時に使用されるスペースの数)
  " sts : softtabstop (0でないなら、タブを入力時、その数値分だけ半角スペースを挿入)
  " ts  : tabstop (タブを画面で表示する際の幅)
  " et  : expandtab (有効時、タブを半角スペースとして挿入)
  " ml  : modeline
  " tw  : textwidth
  " modeline : モードラインを有効

  autocmd!
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType csh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType gitcommit  setlocal sw=4 sts=4 ts=4 et tw=72
  autocmd FileType gitconfig  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType less       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType make       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=8 et tw=80
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType typescript setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et

  autocmd FileType qf,qfreplace,quickrun,git,diff,gitv,gitcommit
        \ setlocal nofoldenable nomodeline foldcolumn=0 foldlevel=0
augroup END
"}}}

"--------------------
" キーマッピング関係
" ([n/v/c/i][nore]map]) <オプション> 入力する操作 Vimが解釈する操作
"--------------------

"{{{
" 設定の仕方"{{{
"----------------------------------------------------------
"   コマンド    | ノーマル | 挿入 | コマンド | ビジュアル |
"----------------------------------------------------------
" map /noremap  |    @@    |  --  |    --    |     @@     |
"----------------------------------------------------------
" nmap/nnoremap |    @@    |  --  |    --    |     --     |
"----------------------------------------------------------
" imap/inoremap |    --    |  @@  |    --    |     --     |
"----------------------------------------------------------
" cmap/cnoremap |    --    |  --  |    @@    |     --     |
"----------------------------------------------------------
" vmap/vnoremap |    --    |  --  |    --    |     @@     |
"----------------------------------------------------------
" map!/noremap! |    --    |  @@  |    @@    |     --     |
"----------------------------------------------------------
"}}}

"{{{
" 移動系"{{{
" 行頭と行末への移動
noremap 1 0
noremap 0 $

" Shift+hjklで5移動
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

"表示上の移動を可能にする
nnoremap j gj
nnoremap k gk

" 水平方向の移動を簡単にする
nnoremap zl zL
nnoremap zh zH

"挿入モードでの移動
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-l> <right>
inoremap <C-d> <delete>
inoremap jj <esc>
"}}}

" 編集系"{{{
" ;と:を入れ替
noremap ; :
noremap : ;

" ノーマルモードでも改行可能
noremap <CR> i<CR><ESC>

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 検索結果のハイライトをC-c連打でクリアする
nnoremap  <C-c><C-c> :<C-u>nohlsearch<cr><Esc>

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" 括弧の編集"{{{
inoremap {{ {}<LEFT>
inoremap [[ []<LEFT>
inoremap (( ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap << <><LEFT>
inoremap ]]5 [%  %]<LEFT><LEFT><LEFT>
inoremap }}5 {%  %}<LEFT><LEFT><LEFT>
inoremap >>5 <%=  %><LEFT><LEFT><LEFT>
"}}}
"}}}

" 矢印キー無効"{{{
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
"}}}

" 補助系"{{{
" ctrl-v で insert/command モードで貼り付け
inoremap <c-v> <esc>"*pa
cnoremap <c-v> <c-r>+

" カーソル位置の単語をyankする
nnoremap vy viwy
" カーソル位置の単語をyankした文字に置き換える
nnoremap vp viwpviwy

cnoremap clean neobundleclean
cnoremap update neobundleupdate
cnoremap install neobundleinstall
cnoremap install! neobundleinstall!

"コマンドモード時のカーソル移動
cnoremap <c-a> <home>
cnoremap <c-b> <left>
cnoremap <c-d> <delete>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-n> <down>
cnoremap <c-p> <up>"
"}}}

"画面分割＆タブページ設定"{{{
noremap s <Nop>
"ウィンドウを分割
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
"分割したウィンドウ間を移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
"分割したウィンドウを移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
"カレントウィンドウの大きさを変える
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap s= <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
"新規タブ
nnoremap st :<C-u>tabnew<CR>
"次のタブに切り替え
nnoremap gl gt
"前のタブに切り替え
nnoremap gh gT
"ウィンドウを閉じる
nnoremap sq :<C-u>q<CR>
"バッファを閉じる
nnoremap sQ :<C-u>bd<CR>
"}}}

" その他"{{{
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q gq

" 線を引く
inoremap <expr> dl* repeat('*', 79 - col('.'))
inoremap <expr> dl# repeat('#', 79 - col('.'))
inoremap <expr> dl+ repeat('+', 79 - col('.'))
inoremap <expr> dl- repeat('-', 79 - col('.'))
inoremap <expr> dl= repeat('=', 79 - col('.'))
"}}}

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成"{{{
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c
"}}}
"}}}
"}}}

"--------------------
" NeoBundle
"--------------------

"{{{

" 各プラグイン"{{{

" NeoBundle"{{{
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
  " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切
  " 読み込まない
  let s:noplugin = 1
else
  " NeoBundleを'runtimepath'に追加し初期化を行う
  if has('vim_starting')
    execute "set runtimepath+=" . s:neobundle_root
  endif
  call neobundle#rc(s:bundle_root)

  " NeoBundle自身をNeoBundleで管理させる
  NeoBundleFetch 'Shougo/neobundle.vim'

  " vimproc非同期通信を可能にする"
  " 'build'が指定されているのでインストール時に自動的に
  " 指定されたコマンドが実行され vimproc がコンパイルされる
  NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}
  "}}}

  " ファイラー"{{{
  " Unite"{{{
  NeoBundleLazy "Shougo/unite.vim", {
        \ "autoload": {
        \   "commands": ["Unite", "UniteWithBufferDir"]
        \ }}

  NeoBundleLazy 'h1mesuke/unite-outline', {
        \ "autoload": {
        \   "unite_sources": ["outline"],
        \ }}
  nnoremap [unite] <Nop>
  nmap ,u [unite]
  nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
  nnoremap <silent> [unite]B :<C-u>Unite buffer_tab -buffer-name=file<CR>
  nnoremap <silent> [unite]r :<C-u>Unite register<CR>
  nnoremap <silent> [unite]m :<C-u>Unite file<CR>
  nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
  nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
  nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
  nnoremap <silent> [unite]w :<C-u>Unite window<CR>
  let s:hooks = neobundle#get_hooks("unite.vim")
  function! s:hooks.on_source(bundle)
    " start unite in insert mode
    let g:unite_enable_start_insert = 1
    " use vimfiler to open directory
    call unite#custom_default_action("source/bookmark/directory", "vimfiler")
    call unite#custom_default_action("directory", "vimfiler")
    call unite#custom_default_action("directory_mru", "vimfiler")
    autocmd MyAutoCmd FileType unite call s:unite_settings()
    function! s:unite_settings()
      imap <buffer> <Esc><Esc> <Plug>(unite_exit)
      nmap <buffer> <Esc> <Plug>(unite_exit)
      nmap <buffer> <C-n> <Plug>(unite_select_next_line)
      nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
    endfunction
  endfunction
  "}}}

  "vimfiler"{{{
  NeoBundleLazy "Shougo/vimfiler", {
        \ "depends": ["Shougo/unite.vim"],
        \ "autoload": {
        \   "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"],
        \   "mappings": ['<Plug>(vimfiler_switch)'],
        \   "explorer": 1,
        \ }}
  nnoremap <Leader>e :VimFilerExplorer<CR>
  " close vimfiler automatically when there are only vimfiler open
  autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
  let s:hooks = neobundle#get_hooks("vimfiler")
  function! s:hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1

    " .から始まるファイルおよび.pycで終わるファイルを不可視パターンに
    let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"

    " vimfiler specific key mappings
    autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
    function! s:vimfiler_settings()
      " ^^ to go up
      nmap <buffer> ^^ <Plug>(vimfiler_switch_to_parent_directory)
      " use R to refresh
      nmap <buffer> R <Plug>(vimfiler_redraw_screen)
      " overwrite C-l
      nmap <buffer> <C-l> <C-w>l
    endfunction
  endfunction
  "}}}

  " vimshell"{{{
  NeoBundleLazy 'Shougo/vimshell', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : {
        \   'commands' : [{ 'name' : 'VimShell',
        \                   'complete' : 'customlist, vimshell#complete'},
        \                   'VimShellExecute',  'VimShellInteractive',
        \                   'VimShellTerminal',  'VimShellPop'],
        \   'mappings' : ['<Plug>(vimshell_']
        \ }}
  "}}}
  "}}}

  " 補完"{{{
  " Insertモードに入るまではneocompleteはロードされない"{{{
  if has('lua') && v:version >= 703 && has('patch885')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
          \ "autoload": {
          \   "insert": 1,
          \ }}
    let g:neocomplete#enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    function! s:hooks.on_source(bundle)
      let g:acp_enableAtStartup = 0
      let g:neocomplet#enable_smart_case = 1
    endfunction
  else
    NeoBundleLazy 'Shougo/neocomplcache.vim', {
          \ "autoload": {
          \   "insert": 1,
          \ }}
    let g:neocomplcache_enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplcache.vim")
    function! s:hooks.on_source(bundle)
      let g:acp_enableAtStartup = 0
      let g:neocomplcache_enable_smart_case = 1
      " NeoComplCacheを有効化
      " NeoComplCacheEnable
    endfunction
  endif
  "}}}

  " Insertモードに入るまでロードしない"{{{
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundleLazy "Shougo/neosnippet.vim", {
        \ "depends": ["honza/vim-snippets"],
        \ "autoload": {
        \   "insert": 1,
        \ }}
  let s:hooks = neobundle#get_hooks("neosnippet.vim")
  function! s:hooks.on_source(bundle)
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: "\<TAB>"
    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    " Enable snipMate compatibility feature.
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell Neosnippet about the other snippets
    let g:neosnippet#snippets_directory=s:bundle_root . '/vim-snippets/snippets'
  endfunction
"}}}

  NeoBundle 'tpope/vim-rails'
  NeoBundle 'vim-ruby/vim-ruby'

  "}}}

  " 編集補助"{{{
  " コメントアウト"{{{
  " gcc コメントアウト
  " gci 文の頭からコメントアウト
  " gcI 行頭からコメントアウト
  " gca 行末にコメントアウト
  " gco カーソル行の下にコメントアウト
  " gcO カーソル行の上にコメントアウト
  NeoBundle 'tyru/caw.vim.git'
"      NeoBundleLazy , {repository}{
"        \ 'autoload' : {
"        \   'insert' : 1,
"        \   'filetypes' : [{filetype}],
"        \   'commands' : [{command}],
"        \   'mappings' : [
"        \     [<mode>, <mapping>]
"        \   ]
"        \ }}
  "}}}

  " テキスト整形
  NeoBundle 'vim-scripts/Align'

  " Yankring"{{{
  " <C-p>, <C-n>
  NeoBundle 'vim-scripts/YankRing.vim'
  "}}}

  "switch : true/false切り替え (+/-)"{{{
  NeoBundleLazy 'AndrewRadev/switch.vim', {
        \ "autoload" : {
        \   "commands" : "Switch",
        \ }}
  "}}}

  " 囲まれているものの編集補助"{{{
  " ヴィジュアルモード
  " This is a selected text.  S'    This is 'a selected text'.
  " This is a selected text.  S"    This is "a selected text".
  " This is a selected text.  S[    This is [ a selected text ].
  " This is a selected text.  S(    This is ( a selected text ).
  " This is a selected text.  S{    This is { a selected text }.
  " This is a selected text.  S<b>  This is <b>a selected text</b>.
  NeoBundle 'tpope/vim-surround'
  "}}}

  " clever-f"{{{
  " f@でカーソルから次の@まで移動できる
  " その後はf連打で文字移動
  NeoBundleLazy 'rhysd/clever-f.vim', {
        \ "autoload" : {
        \   "mappings" : "f",
        \ }}
  "}}}
  "}}}

  " クラスアウトライン"{{{
  NeoBundleLazy 'majutsushi/tagbar', {
        \ "autload": {
        \   "commands": ["TagbarToggle"],
        \ },
        \ "build": {
        \   "mac": "brew install ctags",
        \ }}
  nmap <Leader>t :TagbarToggle<CR>
  "}}}

  " GundoToggle"{{{
  NeoBundleLazy 'sjl/gundo.vim', {
        \ "autoload": {
        \ "commands": ["GundoToggle"]
        \ }}
  nnoremap <Leader>g :GundoToggle<CR>
  "}}}

  " Tasklist"{{{
  NeoBundleLazy "vim-scripts/TaskList.vim", {
        \ "autoload": {
        \   "mappings": ['<Plug>TaskList'],
        \}}
  nmap <Leader>T <plug>TaskList
  "}}}

  " git"{{{
  NeoBundleLazy "mattn/gist-vim", {
        \ "depends": ["mattn/webapi-vim"],
        \ "autoload": {
        \   "commands": ["Gist"],
        \ }}

  NeoBundle "tpope/vim-fugitive"

  NeoBundleLazy "gregsexton/gitv", {
        \ "depends": ["tpope/vim-fugitive"],
        \ "autoload": {
        \   "commands": ["Gitv"],
        \ }}
  " "}}}

  " インデントの可視化"{{{
  NeoBundle "nathanaelkane/vim-indent-guides"
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=110
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=46
  " http://h2plus.biz/hiromitsu/entry/674
  let g:indent_guides_guide_size = 1
  " }}}

  " quickhl : 任意の単語をハイライトにする"{{{
  " <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
  " 再度 <Space>m を行うとカーソル下のハイライトを解除する
  " これは複数の単語のハイライトを行う事もできる
  " <Space>M で全てのハイライトを解除する
  NeoBundleLazy 't9md/vim-quickhl', {
        \ "autoload": {
        \   "mappings": ["<Plug>(quickhl-manual-reset)", "<Plug>(quickhl-manual-this)"]
        \}}
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
  "}}}

  " シンタックスチェック"{{{
  NeoBundle "scrooloose/syntastic", {
        \ "build": {
        \   "mac": ["pip install flake8", "npm -g install coffeelint"],
        \   "unix": ["pip install flake8", "npm -g install coffeelint"],
        \ }}
  "}}}

  " クラスアウトライン"{{{
  NeoBundleLazy 'majutsushi/tagbar', {
        \ "autload": {
        \   "commands": ["TagbarToggle"],
        \ },
        \ "build": {
        \   "mac": "brew install ctags",
        \ }}
  nmap <Leader>t :TagbarToggle<CR>
  "}}}

  " quickrun : vim上で実行"{{{
  " :QuickRun, \r
  " 新規画面を右に出し、結果表示
  NeoBundleLazy "thinca/vim-quickrun", {
        \ "autoload": {
        \   "mappings": ['nxo', '<Plug>(quickrun)']
        \ }}
  nmap <Leader>r <Plug>(quickrun)
  let s:hooks = neobundle#get_hooks("vim-quickrun")
  function! s:hooks.on_source(bundle)
    let g:quickrun_config = {
          \ "*": {"runner": "remote/vimproc"},
          \ }
    let g:quickrun_config={'*': {'split': 'vertical'}}
    set splitright
  endfunction
  "}}}

  " メモ"{{{
  NeoBundle 'glidenote/memolist.vim'
  NeoBundle 'fuenor/qfixgrep.git'
  " 新規作成
  cnoremap ,mn :MemoNew<CR>
  " メモ一覧
  cnoremap ,ml  :MemoList<CR>
  " メモ検索
  cnoremap ,mg  :MemoGrep<CR>
  " 保存先
  let g:memolist_path="~/Documents/memo"
  " 形式
  let g:memolist_memo_suffix="txt"
  " タグの有効化
  let g:memolist_prompt_tags=1
  " カテゴリの有効化
  let g:memolist_prompt_categories=1
  let g:memolist_qfixgrep=1
  let g:memolist_vimfiler=1
  "}}}

  " URLを開いたり、ググったり出来る"{{{
  NeoBundleLazy "tyru/open-browser.vim", {
        \   'autoload' : {
        \       'functions' : "OpenBrowser",
        \       'commands'  : ["OpenBrowser", "OpenBrowserSearch"],
        \       'mappings'  : "<Plug>(openbrowser-smart-search)"
        \   }}

  " カーソル下のURLをブラウザで開く
  nmap <Leader>o <Plug>(openbrowser-smart-search)
  vmap <Leader>o <Plug>(openbrowser-smart-search)
  "}}}

  " ブラウザを自動更新するプラグイン"{{{
  " NeoBundle 'tell-k/vim-browsereload-mac'
  " " リロード後に戻ってくるアプリ 変更してください
  " let g:returnApp = "iTerm"
  " nmap <Space>bc :ChromeReloadStart<CR>
  " nmap <Space>bC :ChromeReloadStop<CR>
  " nmap <Space>bf :FirefoxReloadStart<CR>
  " nmap <Space>bF :FirefoxReloadStop<CR>
  " nmap <Space>bs :SafariReloadStart<CR>
  " nmap <Space>bS :SafariReloadStop<CR>
  " nmap <Space>bo :OperaReloadStart<CR>
  " nmap <Space>bO :OperaReloadStop<CR>
  " nmap <Space>ba :AllBrowserReloadStart<CR>
  " nmap <Space>bA :AllBrowserReloadStop<CR>
  "}}}

  " HTML関係{{{
  " html5のコードをシンタックス表示する"{{{
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'taichouchou2/html5.vim'
  " HTML 5 tags
  syn keyword htmlTagName contained article aside audio bb canvas command
  syn keyword htmlTagName contained datalist details dialog embed figure
  syn keyword htmlTagName contained header hgroup keygen mark meter nav output
  syn keyword htmlTagName contained progress time ruby rt rp section time
  syn keyword htmlTagName contained source figcaption
  syn keyword htmlArg contained autofocus autocomplete placeholder min max
  syn keyword htmlArg contained contenteditable contextmenu draggable hidden
  syn keyword htmlArg contained itemprop list sandbox subject spellcheck
  syn keyword htmlArg contained novalidate seamless pattern formtarget
  syn keyword htmlArg contained formaction formenctype formmethod
  syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
  syn keyword htmlArg contained hidden role
  syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
  syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"
  "}}}

  " html/CSS入力補助プラグイン"{{{
  NeoBundle 'mattn/emmet-vim'
  let g:user_emmet_mode = 'iv'
  let g:user_emmet_leader_key = '<C-e>'
  let g:use_emmet_complete_tag = 1
  let g:user_emmet_settings = {
        \ 'lang' : 'ja',
        \ 'html' : {
        \   'filters' : 'html',
        \ },
        \ 'css' : {
        \   'filters' : 'fc',
        \ },
        \ 'php' : {
        \   'extends' : 'html',
        \   'filters' : 'html',
        \ },
        \}
  augroup EmmitVim
    autocmd!
    autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
  augroup END
  "}}}

  " HTMLが開かれるまでロードしない"{{{
  " NeoBundle 'mattn/zencoding-vim'
  "}}}
  "}}}

  " python関係"{{{
  " Djangoを正しくVimで読み込めるようにする"{{{
  " NeoBundleLazy "lambdalisue/vim-django-support", {
  "       \ "autoload": {
  "       \   "filetypes": ["python", "python3", "djangohtml"]
  "       \ }}
  " "}}}
  "
  " Vimで正しくvirtualenvを処理できるようにする"{{{
  " NeoBundleLazy "jmcantrell/vim-virtualenv", {
  "       \ "autoload": {
  "       \   "filetypes": ["python", "python3", "djangohtml"]
  "       \ }}
  " "}}}
  "
  " jedi-vim"{{{
  " NeoBundleLazy "davidhalter/jedi-vim", {
  "       \ "autoload": {
  "       \   "filetypes": ["python", "python3", "djangohtml"],
  "       \ },
  "       \ "build": {
  "       \   "mac": "pip install jedi",
  "       \   "unix": "pip install jedi",
  "       \ }}
  " let s:hooks = neobundle#get_hooks("jedi-vim")
  " function! s:hooks.on_source(bundle)
  "   let g:jedi#auto_vim_configuration = 0
  "   " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  "   let g:jedi#popup_select_first = 0
  "   " quickrunと被るため大文字に変更
  "   let g:jedi#rename_command = '<Leader>R'
  "   " gundoと被るため大文字に変更
  "   let g:jedi#goto_command = '<Leader>G'
  " endfunction
  " "}}}
  " "}}}

  " カラースキーム"{{{
  " :Unite colorscheme -auto-priview
  " NeoBundle 'ujihisa/unite-colorscheme'
  " NeoBundle 'altercation/vim-colors-solarized'
  " NeoBundle 'croaker/mustang-vim'
  " NeoBundle 'nanotech/jellybeans.vim'
  " NeoBundle 'tomasr/molokai'
  " NeoBundle 'w0ng/vim-hybrid'
  " NeoBundle 'vim-scripts/twilight'
  " NeoBundle 'jonathanfilip/vim-lucius'
  " NeoBundle 'vim-scripts/Wombat'
  " NeoBundle 'vim-scripts/rdark'
  " NeoBundle 'altercation/vim-colors-solarized'
  " NeoBundle 'jeffreyiacono/vim-colors-wombat'
  " NeoBundle 'vim-scripts/Lucius'
  " NeoBundle 'vim-scripts/Zenburn'
  " NeoBundle 'mrkn/mrkn256.vim'
  " NeoBundle 'therubymug/vim-pyte'
  " NeoBundle 'chriskempson/vim-tomorrow-theme'
  NeoBundle 'jpo/vim-railscasts-theme'
  colorscheme railscasts
  "}}}

  " ステータスライン表示"{{{
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'osyo-manga/vim-anzu'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'airblade/vim-gitgutter'

  " git関連
  let g:gitgutter_sign_added = '✚'
  let g:gitgutter_sign_modified = '➜'
  let g:gitgutter_sign_removed = '✘'

  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'gitgutter', 'filename', 'currenttag' ] ],
        \  'right': [ [ 'syntastic', 'lineinfo' ],
        \             [ 'percent' ],
        \             [ 'readonly', 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'currenttag': 'MyCurrentTag',
        \   'anzu': 'anzu#search_status',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlag'
        \ },
        \ 'component_type': {
        \   'syntastic': 'error'
        \ },
        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
        \ }

  let g:syntastic_mode_map = { 'mode': 'passive' }

  augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
  augroup END

  function! s:syntastic()
    SyntasticCheck
    call lightline#update()
  endfunction

  function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
  endfunction

  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction

  function! MyFugitive()
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
      endif
    catch
    endtry
    return ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''

  endfunction

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! MyMode()
    return
          \ &ft == 'unite' ? 'Unite' :
          \ &ft == 'vimfiler' ? 'VimFiler' :
          \ &ft == 'vimshell' ? 'VimShell' :
          \ winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  function! MyGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
          \ || ! get(g:, 'gitgutter_enabled', 0)
          \ || winwidth('.') <= 90
      return ''
    endif
    let symbols = [
          \ g:gitgutter_sign_added . ' ',
          \ g:gitgutter_sign_modified . ' ',
          \ g:gitgutter_sign_removed . ' '
          \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
      if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
      endif
    endfor
    return join(ret, ' ')
  endfunction

  function! MyCurrentTag()
    return tagbar#currenttag('%s', '')
  endfunction
  "}}}

  " その他"{{{
  " Twitter"{{{
  NeoBundle 'basyura/TweetVim'
  NeoBundle 'mattn/webapi-vim'
  NeoBundle 'basyura/twibill.vim'
  NeoBundle 'basyura/bitly.vim'
  nnoremap tw :TweetVimSay
  "}}}

  " バッファ一覧を表示し、ショートカットを開ける"{{{
  " :EasyBuffer
  NeoBundleLazy 'troydm/easybuffer.vim', {
        \ 'autoload': {
        \ 'command' : 'EasyBuffer',
        \ }}
  "}}}

  " scouter : vimmerの戦闘力(vimrcの行数)を計測する"{{{
  "   100行以下  : 初心者
  "   500行以下  : 初級者
  "   1000行以下 : 中級者
  "   1000行以上 : 上級者
  "   計測不能   : 神
  NeoBundleLazy 'thinca/vim-scouter', {
        \ "autoload" : {
        \   "commands" : "Scouter"
        \ }}
  "}}}

  " 日本語ヘルプ
  NeoBundle 'vim-jp/vimdoc-ja'
  "}}}

  " インストールされていないプラグインのチェックおよびダウンロード
  NeoBundleCheck
endif
"}}}

" ファイルタイププラグインおよびインデントを有効化
syntax on
filetype plugin indent on
"}}}
