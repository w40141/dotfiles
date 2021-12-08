" 編集設定

lua << EOF
-- deleteでインデントを削除可能にする
vim.o.backspace = 'indent,eol,start'
-- 閉括弧が入力された時、対応する括弧を強調する
vim.o.showmatch = true
-- 閉括弧が入力された時対応する括弧に一時的に移動
vim.o.startofline = false
-- コマンドライン履歴保存
vim.o.history = 10000
-- カーソルを行頭、行末で止まらないようにする
vim.opt.whichwrap:append('b,s,h,l,<,>,[,]')
-- カーソルを常に画面の中央に表示させる
vim.o.scrolloff = 999
-- C-vの矩形選択で行末より後ろもカーソルを置ける
vim.o.virtualedit = 'block'
-- 新しく開く代わりにすでに開いてあるバッファを開く
vim.o.switchbuf = 'useopen'
-- <'や'>'でインデントする際に'shiftwidth'の倍数に丸める
vim.o.shiftround = true
-- 行頭での<tab>の幅
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
-- 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
vim.o.smarttab = true
-- cプログラムの自動インデント
vim.o.cindent = true
-- タブを空白入力に置換
vim.o.expandtab = true
-- 補完時に大文字小文字を区別しない
vim.o.infercase = true
-- 必要ない設定
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.backup = false
EOF
