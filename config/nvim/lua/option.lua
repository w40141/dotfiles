local set = vim.opt

-- 基本設定
-- 文字コード
set.encoding = 'utf-8'
set.fileformats = 'unix,dos,mac'
set.fileencodings='utf-8,sjis'
-- 256色設定にする
if vim.fn.has('gui_running') == false then
    set.t_Co = 256
end
-- 全モードでマウスを有効化
set.mouse = 'a'
-- 変更中のファイルでも、保存しないで他のファイルを表示する
set.hidden = true
-- スペルチェック
set.spell = false
-- 内容が変更されたら自動的に再読み込み
set.autoread = true
-- クリップボードをWindowsと連携する
set.clipboard = 'unnamed,unnamedplus'
-- ビープ音すべてを無効にする
set.visualbell = true
set.errorbells = false
-- 自動更新の時間
set.updatetime = 200

-- 表示設定
-- 行番号を表示する
set.number = true
-- タイトルをウィンドウ枠に表示する
set.title = true
-- 不可視文字を表示
set.list = true
set.listchars = {
    tab = '▸ ', extends = '»', trail = '-', precedes = '«', eol = '↲', nbsp = '%', space = '⋅'
}
-- ウィンドウ幅より長い行は折り返して、次の行に続けて表示す
set.wrap = true
-- 新しい行のインデントを現在行と同じにする
set.smartindent = true
-- コマンド行の長さ
set.cmdheight = 2
-- カラムを表示
set.signcolumn = 'yes'
-- エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set.laststatus = 2
-- ステータスラインにコマンドを表示
set.showcmd = true
-- 1行が長くても全部表示
set.display = 'lastline'
-- set display=lastline
-- ポップアップメニューの高さを指定
set.pumheight = 30
-- カーソル行の強調表示
set.cursorline = true
-- コマンドラインでmodeの表示をしない
set.showmode = false
-- 日本語help
set.helplang = 'ja'
set.background = 'dark'
-- 文字を隠す
if vim.fn.has('conceal') == 1 then
    set.conceallevel = 1
    set.concealcursor = 'c'
end

-- 検索設定
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

-- 編集設定
-- deleteでインデントを削除可能にする
set.backspace = 'indent,eol,start'
-- 
set.completeopt = 'menuone,noinsert'
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
-- set.cindent = true
-- タブを空白入力に置換
set.expandtab = true
-- 補完時に大文字小文字を区別しない
set.infercase = true
-- 必要ない設定
set.writebackup = false
set.swapfile = false
set.backup = false

-- 不要なデフォルトプラグイン
local g = vim.g
g.do_filetype_lua = 1
g.did_load_filetypes = 0
g.did_indent_on             = 1
g.did_install_default_menus = 1
g.did_install_syntax_menu   = 1
g.loaded_2html_plugin       = 1
g.loaded_gzip               = 1
g.loaded_getscript          = 1
g.loaded_getscriptPlugin    = 1
g.loaded_man                = 1
g.loaded_matchit            = 1
g.loaded_netrw              = 1
g.loaded_netrwFileHandlers  = 1
g.loaded_netrwPlugin        = 1
g.loaded_netrwSettings      = 1
g.loaded_rrhelper           = 1
g.loaded_shada_plugin       = 1
g.loaded_spellfile_plugin   = 1
g.loaded_tar                = 1
g.loaded_tarPlugin          = 1
g.loaded_tutor_mode_plugin  = 1
g.loaded_vimball            = 1
g.loaded_vimballPlugin      = 1
g.loaded_zip                = 1
g.loaded_zipPlugin          = 1
g.skip_loading_mswin        = 1
