local opt = vim.opt

-- 基本設定
-- 文字コード
opt.encoding = "utf-8"
opt.fileencodings = "utf-8"
-- 全モードでマウスを有効化
opt.mouse = "a"
-- 変更中のファイルでも、保存しないで他のファイルを表示する
opt.hidden = true
-- スペルチェック
-- opt.spell = true
-- opt.spelllang = "en"
-- 内容が変更されたら自動的に再読み込み
opt.autoread = true
opt.number = true
-- クリップボードをWindowsと連携する
opt.clipboard = { "unnamed", "unnamedplus" }
-- ビープ音すべてを無効にする
opt.visualbell = true
opt.errorbells = false
-- 自動更新の時間
opt.updatetime = 300
-- タイトルをウィンドウ枠に表示する
opt.title = true
-- 不可視文字を表示
opt.list = true
opt.listchars = {
	tab = "▸ ",
	extends = "»",
	trail = "-",
	precedes = "«",
	eol = "↴",
	nbsp = "%",
	space = "⋅",
}
-- ウィンドウ幅より長い行は折り返して、次の行に続けて表示す
opt.wrap = true
-- コマンド行の長さ
opt.cmdheight = 1
-- カラムを表示
opt.signcolumn = "yes"
-- エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
opt.laststatus = 2
-- ステータスラインにコマンドを表示
opt.showcmd = true
-- 1行が長くても全部表示
opt.display = "lastline"
-- ポップアップメニューの高さを指定
opt.pumheight = 30
-- カーソル行の強調表示
opt.cursorline = true
-- コマンドラインでmodeの表示をしない
opt.showmode = false
-- 日本語help
opt.helplang = "ja"
opt.background = "dark"
-- 文字を隠す
opt.conceallevel = 1
-- 検索設定
-- 検索時に大/小を区別しない
opt.ignorecase = true
-- 検索時に大文字を含んでいたら大/小を区別
opt.smartcase = true
-- 検索時にマッチした単語をハイライトにする
opt.hlsearch = true
-- 検索時に最後まで行ったら最初に戻る
opt.wrapscan = true
-- インクリメンタルサーチを行う
opt.incsearch = true
-- 編集設定
-- deleteでインデントを削除可能にする
opt.backspace = { "indent", "eol", "start" }
opt.completeopt = { "menu", "menuone", "noselect" }
-- 閉括弧が入力された時、対応する括弧を強調する
opt.showmatch = true
-- 閉括弧が入力された時対応する括弧に一時的に移動
opt.startofline = false
-- コマンドライン履歴保存
opt.history = 10000
-- カーソルを常に画面の中央に表示させる
opt.scrolloff = 999
-- C-vの矩形選択で行末より後ろもカーソルを置ける
opt.virtualedit = "block"
-- 新しく開く代わりにすでに開いてあるバッファを開く
opt.switchbuf = "useopen"
-- <"や">"でインデントする際に"shiftwidth"の倍数に丸める
opt.shiftround = true
-- 行頭での<tab>の幅
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
-- 新しい行のインデントを現在行と同じにする
opt.smartindent = true
-- 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
opt.smarttab = true
-- タブを空白入力に置換
opt.expandtab = false
-- 補完時に大文字小文字を区別しない
opt.infercase = true
-- 必要ない設定
opt.writebackup = false
opt.swapfile = false
opt.backup = false
opt.termguicolors = true
-- カーソルを行頭、行末で止まらないようにする
opt.whichwrap = "b,s,h,l,<,>,[,]"
opt.winblend = 20
opt.pumblend = 20
