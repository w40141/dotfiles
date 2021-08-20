" 表示設定
" 不可視文字を表示
set list listchars=tab:▸\ ,trail:-,extends:»,precedes:«,eol:↲,nbsp:%
" 行番号を表示する
set number
" 行番号を相対表示にする
set relativenumber
" タイトルをウィンドウ枠に表示する
set title
" ウィンドウ幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 新しい行のインデントを現在行と同じにする
" set smartindent
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

autocmd ColorScheme * highlight Visual ctermbg=225
