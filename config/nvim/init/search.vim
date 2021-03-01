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
set shortmess+=sSIFac
" grep 検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
