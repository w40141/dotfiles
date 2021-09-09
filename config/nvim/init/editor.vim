" 編集設定
" 折りたたみ機能を使う
" set foldenable

" set foldmethod=indent
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
" set wildmenu
" vimのコマンドライン
" set wildmode=list:longest,full
set wildmode=longest:full,full
" カーソルを行頭、行末で止まらないようにする
set whichwrap+=b,s,h,l,<,>,[,]
" カーソルを常に画面の中央に表示させる
set scrolloff=999
" 改行後にdeleteで上行末尾の一文字を消す
set backspace=2
"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block
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

" 行頭での<tab>の幅
set shiftwidth=4 softtabstop=4 tabstop=4
" 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
set smarttab
" cプログラムの自動インデント
set cindent
" タブを空白入力に置換
set expandtab

