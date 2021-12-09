-- 編集設定

local set = vim.opt
-- deleteでインデントを削除可能にする
set.backspace = 'indent,eol,start'
-- 閉括弧が入力された時、対応する括弧を強調する
set.showmatch = true
-- 閉括弧が入力された時対応する括弧に一時的に移動
set.startofline = false
-- コマンドライン履歴保存
set.history = 10000
-- カーソルを行頭、行末で止まらないようにする
set.whichwrap:append('b,s,h,l,<,>,[,]')
-- カーソルを常に画面の中央に表示させる
set.scrolloff = 999
-- C-vの矩形選択で行末より後ろもカーソルを置ける
set.virtualedit = 'block'
-- 新しく開く代わりにすでに開いてあるバッファを開く
set.switchbuf = 'useopen'
-- <'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set.shiftround = true
-- 行頭での<tab>の幅
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
-- 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
set.smarttab = true
-- cプログラムの自動インデント
set.cindent = true
-- タブを空白入力に置換
set.expandtab = true
-- 補完時に大文字小文字を区別しない
set.infercase = true
-- 必要ない設定
set.writebackup = false
set.swapfile = false
set.backup = false
