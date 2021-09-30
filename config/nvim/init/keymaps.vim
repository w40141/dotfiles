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

" ペーストモード
" set pastetoggle=<C-p>

" <Leader>キーを変更 (default: \)
let g:mapleader=' '
let g:maplocalleader=' '
" 移動系
"行頭と行末への移動
noremap 0 $
noremap 1 0
"表示上の移動を可能にする
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" 水平方向の移動を簡単にする
nnoremap zl zL
nnoremap zh zH
""挿入モードでの移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <delete>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <silent> jj <ESC>:<C-u>w<CR>
" 編集系
" ;と:を入れ替
noremap ; :
noremap : ;
" キー置換
" noremap ,h ^
" noremap ,l $
" noremap ,m %
" nnoremap ,/ *
" ノーマルモードでも改行可能
noremap <CR> i<CR><esc>
" 保存
nnoremap ,w :w<CR>
" ビジュアルラインモード
" nmap ,, V
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" 検索結果のハイライトをC-h連打でクリアする
nnoremap  <ESC><ESC> :<C-u>nohlsearch<CR>
" vを二回で行末まで選択
vnoremap v $h
" tabにて対応ペアにジャンプ
nnoremap <TAB> %
vnoremap <TAB> %
" カッコ
" inoremap << <><Left>
" 補助系
" ctrl-v で insert/command モードで貼り付け
inoremap <C-v> <esc>"*pa
cnoremap <C-v> <C-r>+
" insert モードで保存
" inoremap <C-s> <Esc>:w<CR>i
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
nnoremap ,? :!open dict://<cword><CR>

" ウィンドウ
" ウィンドウを分割
nnoremap <silent> sp :<C-u>sp<CR>
nnoremap <silent> sv :<C-u>vs<CR>
" 分割したウィンドウ間を移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" ウィンドウを閉じる
nnoremap sc <C-w>c
nnoremap so <C-w>o
nnoremap sq :<C-u>q<CR>
nnoremap ss :<C-u>w<CR>

" タブ
" 新規タブ
nnoremap <silent> st :<C-u>tabnew<CR>
" 次のタブに切り替え
nnoremap <C-l> gt
" 前のタブに切り替え
nnoremap <C-h> gT

" バッファ
" バッファを閉じる
nnoremap bq :<C-u>bd<CR>
" バッファリストの1つ前のバッファを開く
nnoremap <silent> bp :bprevious<CR>
" バッファリストの次のバッファを開く
nnoremap <silent> bn :bnext<CR>
" 直前のバッファを開く
nnoremap <silent> bb :b#<CR>
" バッファリストの先頭を開く
nnoremap <silent> bf :bf<CR>
" バッファリストの最後を開く
nnoremap <silent> bl :bl<CR>
" 変更中の次のバッファへ移動
nnoremap <silent> bm :bm<CR>
" カレントのバッファを閉じてバッファリストから削除
nnoremap <silent> bd :bdelete<CR>


nnoremap <silent> <leader><leader> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>

" その他
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" vnoremap { "zdi{<C-r>z}<ESC>
" vnoremap [ "zdi[<C-r>z]<ESC>
" vnoremap ( "zdi(<C-r>z)<ESC>
" vnoremap " "zdi"<C-r>z^V"<ESC>
" vnoremap ' "zdi'<C-r>z'<ESC>
nnoremap q gq
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
	if !isdirectory(a:dir) && (a:force ||
				\ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
		call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
	endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" 保存して閉じる、保存せずに閉じるを無効
nnoremap ZZ <nop>
nnoremap ZQ <nop>
" 矢印キー無効
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
