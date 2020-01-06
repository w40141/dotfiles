" 基本設定
" 文字コード
set encoding=utf-8
scriptencoding utf-8
" 256色設定にする
if !has('gui_running')
	set t_Co=256
endif
" MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup end
" 全モードでマウスを有効化
set mouse=a
" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
" スペルチェック
set spelllang=en,cjk
" 内容が変更されたら自動的に再読み込み
set autoread
" クリップボードをWindowsと連携する
set clipboard=unnamed
" ビープ音すべてを無効にする
set visualbell
" set t_vb=
set noerrorbells
" 自動更新の時間
set updatetime=300
" <Leader>キーを変更 (default: \)
let g:mapleader=' '
let g:maplocalleader=' '

" 検索設定
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
" 検索位置が何番目のマッチ場所か
set shortmess+=sSIFa
" grep 検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 表示設定
" 不可視文字を表示
set list listchars=tab:▸\ ,trail:-,extends:»,precedes:«,eol:¬
set guifont=DroidSansMono_Nerd_Font:h11
" 行番号を表示する
set number
" タイトルをウィンドウ枠に表示する
set title
" ウィンドウ幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 新しい行のインデントを現在行と同じにする
set smartindent
" コマンド行の長さ
set cmdheight=2
" カラムを表示
set signcolumn=yes
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set laststatus=2
" ステータスラインにコマンドを表示
set showcmd
" 1行が長くても全部表示
set display=lastline
" ポップアップメニューの高さを指定
set pumheight=30
" カーソル行の強調表示
set cursorline
" コマンドラインでmodeの表示をしない
set noshowmode
" 日本語help
set helplang=ja
set background=dark
" 文字を隠す
if has('conceal')
	set conceallevel=1
	set concealcursor=c
endif

" 編集設定
" 折りたたみ機能を使う
" set foldenable
" set foldmethod=expr
" set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
" set foldcolumn=1
" set foldlevel=1
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
" ペーストモード
set pastetoggle=<C-s>
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" 補完時に大文字小文字を区別しない
set infercase
" 対応括弧に'<'と'>'のペアを追加
" set matchpairs& matchpairs+=<:>
set nowritebackup
set noswapfile
set nobackup

" 不要なデフォルトプラグイン
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 0
let g:loaded_netrwFileHandlers = 0

" キーマッピング
" 設定例
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
" ([n/v/c/i][nore]map]) <オプション> 入力する操作 Vimが解釈する操作
" noremap は再帰的に定義しない。
" map は再帰的に定義する。
" 詳しくは→ http://cocopon.me/blog/?p=3871
" 確認する場合:map

" キーマッピング設定

" 移動系
"行頭と行末への移動
noremap 1 0
noremap 0 $
"表示上の移動を可能にする
nnoremap j gj
nnoremap k gk
" 水平方向の移動を簡単にする
nnoremap zl zL
nnoremap zh zH
"挿入モードでの移動
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-b> <BS>
inoremap <C-d> <delete>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap jk <esc>
" 編集系
" ;と:を入れ替
noremap ; :
noremap : ;
" キー置換
noremap <space>h ^
noremap <space>l $
noremap <space>m %
nnoremap <space>/ *
" ノーマルモードでも改行可能
noremap <cr> i<cr><esc>
" 保存
nnoremap <Leader>w :w<CR>
" ビジュアルラインモード 
nmap <Leader><Leader> V
" コンマの後に自動的にスペースを挿入
inoremap , ,<space>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" 検索結果のハイライトをC-c連打でクリアする
nnoremap  <C-h><C-h> :<C-u>nohlsearch<cr><Esc>
" vを二回で行末まで選択
vnoremap v $h
" tabにて対応ペアにジャンプ
nnoremap <tab> %
vnoremap <tab> %
" カッコ
" inoremap << <><Left>

" 補助系
" ctrl-v で insert/command モードで貼り付け
inoremap <C-v> <esc>"*pa
cnoremap <C-v> <C-r>+
" insert モードで保存
inoremap <C-s> <Esc>:w<CR>i
" Yで行末までヤンク
nnoremap Y y$
" カーソル位置の単語をyankする
nnoremap vy viwy
" カーソル位置の単語をyankした文字に置き換える
nnoremap vp viwpviwy
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" コマンドモード時のカーソル移動
cnoremap <C-a> <home>
cnoremap <C-b> <left>
cnoremap <C-d> <delete>
cnoremap <C-e> <end>
cnoremap <C-f> <right>
cnoremap <C-n> <down>
cnoremap <C-p> <up>
" 辞書
nnoremap <Leader>? :!open dict://<cword><CR>
" 矢印キー無効
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ウィンドウ
" ウィンドウを分割
nnoremap sp :<C-u>sp<cR>
nnoremap vs :<C-u>vs<cR>
" 分割したウィンドウ間を移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
nnoremap sr <C-w>r
" カレントウィンドウの大きさを変える
nnoremap so <C-w>_<C-w>|
nnoremap s= <C-w>=
nnoremap sn :<C-u>bn<cR>
" ウィンドウを閉じる
nnoremap sq :<C-u>q<cr>

" タブ
" 新規タブ
nnoremap st :<C-u>tabnew<CR>
" 次のタブに切り替え
nnoremap <C-l> gt
" 前のタブに切り替え
nnoremap <C-h> gT

" バッファ
" バッファを閉じる
nnoremap bq :<C-u>bd<cR>
" バッファリストの1つ前のバッファを開く
nnoremap <silent>bp :bprevious<CR>
" バッファリストの次のバッファを開く
nnoremap <silent>bn :bnext<CR>
" 直前のバッファを開く
nnoremap <silent>bb :b#<CR>
" バッファリストの先頭を開く
nnoremap <silent>bf :bf<CR>
" バッファリストの最後を開く
nnoremap <silent>bl :bl<CR>
" 変更中の次のバッファへ移動
nnoremap <silent>bm :bm<CR>
" カレントのバッファを閉じてバッファリストから削除
nnoremap <silent>bd :bdelete<CR>

" neovim terminal mapping
if has('nvim')
	" terminal mapping
	" 新しいタブでターミナルを起動
	nnoremap @T :tabe<CR>:terminal<CR>
	nnoremap @t :split<CR><C-w>j:terminal<CR>
	" Ctrl + q でターミナルを終了
	tnoremap <C-q> <C-\><C-n>:q<CR>
	" <C-j>でターミナルモードからノーマルモードへ
	tnoremap <C-j> <C-\><C-n>
	" ターミナルモードでのタブ移動
	tnoremap <C-l> <C-\><C-n>gt
	tnoremap <C-h> <C-\><C-n>gT
endif

" その他
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
vnoremap { "zdi^v{<C-r>z}<ESC>
vnoremap [ "zdi^v[<C-r>z]<ESC>
vnoremap ( "zdi^v(<C-r>z)<ESC>
vnoremap " "zdi^v"<C-r>z^V"<ESC>
vnoremap ' "zdi'<C-r>z'<ESC>
nnoremap zz <nop>
nnoremap zq <nop>
nnoremap q gq
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
	if !isdirectory(a:dir) && (a:force ||
				\ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
		call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
	endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" 言語別設定

" タブ設定方法
" autocmd filetype <language> setlocal shiftwidth=? tabstop=? softtabstop=?
" Set sw/sts/ts
" sw  : shiftwidth (インデント時に使用されるスペースの数)
" sts : softtabstop (0でないなら、タブを入力時、その数値分だけ半角スペースを挿入)
" ts  : tabstop (タブを画面で表示する際の幅)
" et  : expandtab (有効時、タブを半角スペースとして挿入)
" ml  : modeline
" tw  : textwidth
" modeline : モードラインを有効

" 行頭での<tab>の幅
set shiftwidth=4 tabstop=4 softtabstop=4
" 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
set smarttab
" タブを空白入力に置換
set expandtab

" 言語ごとの設定
augroup MyAutoCmd
	autocmd filetype apache     setlocal sw=4 sts=4 ts=4
	autocmd filetype aspvbs     setlocal sw=4 sts=4 ts=4
	autocmd filetype c          setlocal sw=4 sts=4 ts=4
	autocmd filetype coffee     setlocal sw=2 sts=2 ts=2
	autocmd filetype cpp        setlocal sw=4 sts=4 ts=4
	autocmd filetype cs         setlocal sw=4 sts=4 ts=4
	autocmd filetype csh        setlocal sw=4 sts=4 ts=4
	autocmd filetype css        setlocal sw=2 sts=2 ts=2
	autocmd filetype diff       setlocal sw=4 sts=4 ts=4
	autocmd filetype eruby      setlocal sw=4 sts=4 ts=4
	autocmd filetype gitcommit  setlocal sw=4 sts=4 ts=4
	autocmd filetype gitconfig  setlocal sw=2 sts=2 ts=2
	autocmd filetype haml       setlocal sw=2 sts=2 ts=2
	autocmd filetype html       setlocal sw=2 sts=2 ts=2
	autocmd filetype java       setlocal sw=4 sts=4 ts=4
	autocmd filetype javascript setlocal sw=2 sts=2 ts=2
	autocmd filetype jsx				setlocal sw=2 sts=2 ts=2
	autocmd filetype less       setlocal sw=2 sts=2 ts=2
	autocmd filetype make       setlocal sw=4 sts=4 ts=4
	autocmd filetype perl       setlocal sw=4 sts=4 ts=4
	autocmd filetype php        setlocal sw=4 sts=4 ts=4
	autocmd filetype ruby       setlocal sw=2 sts=2 ts=2
	autocmd filetype scala      setlocal sw=2 sts=2 ts=2
	autocmd filetype sh         setlocal sw=4 sts=4 ts=4
	autocmd filetype sql        setlocal sw=4 sts=4 ts=4
	autocmd filetype typescript setlocal sw=4 sts=4 ts=4
	autocmd filetype vb         setlocal sw=4 sts=4 ts=4
	autocmd filetype verilog    setlocal sw=4 sts=4 ts=4
	autocmd filetype vim        setlocal sw=2 sts=2 ts=2
	autocmd filetype wsh        setlocal sw=4 sts=4 ts=4
	autocmd filetype xhtml      setlocal sw=2 sts=2 ts=2
	autocmd filetype xml        setlocal sw=2 sts=2 ts=2
	autocmd filetype yaml       setlocal sw=2 sts=2 ts=2
	autocmd filetype zsh        setlocal sw=4 sts=4 ts=4
	autocmd filetype qf,qfreplace,quickrun,git,diff,gitv,gitcommit
				\ setlocal nofoldenable nomodeline foldcolumn=0 foldlevel=0
	autocmd BufNewFile,BufRead .{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
	autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
	" pip install yapf
	autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
augroup END

" dein settings
if has('nvim')
	let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
	let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
	let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
	let g:node_host_prog = '/usr/local/bin/neovim-node-host'
endif

" dein自体の自動インストール
let s:cache_home		= empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir			= s:cache_home . '/dein'
let s:dein_repo_dir	= s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:rc_dic			= expand('~/.config/nvim')
let s:toml				= s:rc_dic . '/dein.toml'
let s:toml_lazy		= s:rc_dic . '/dein_lazy.toml'
" プラグイン読み込み＆キャッシュ作成
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml,       {'lazy':0})
	call dein#load_toml(s:toml_lazy,  {'lazy':1})
	call dein#end()
	call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax on
