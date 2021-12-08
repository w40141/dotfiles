" 検索設定

lua << EOF
-- 検索時に大/小を区別しない
vim.o.ignorecase = true
-- 検索時に大文字を含んでいたら大/小を区別
vim.o.smartcase = true
-- 検索時にマッチした単語をハイライトにする
vim.o.hlsearch = true
-- 検索時に最後まで行ったら最初に戻る
vim.o.wrapscan = true
-- インクリメンタルサーチを行う
vim.o.incsearch = true
EOF
