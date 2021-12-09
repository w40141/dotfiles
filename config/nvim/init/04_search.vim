" 検索設定

lua << EOF
local set = vim.opt
-- 検索時に大/小を区別しない
set.ignorecase = true
-- 検索時に大文字を含んでいたら大/小を区別
set.smartcase = true
-- 検索時にマッチした単語をハイライトにする
set.hlsearch = true
-- 検索時に最後まで行ったら最初に戻る
set.wrapscan = true
-- インクリメンタルサーチを行う
set.incsearch = true
EOF
