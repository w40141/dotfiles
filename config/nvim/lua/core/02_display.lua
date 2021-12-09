-- 表示設定

local set = vim.opt
-- 行番号を表示する
set.number = true
-- タイトルをウィンドウ枠に表示する
set.title = true
-- 不可視文字を表示
set.list = true
set.listchars = {
    tab = '▸ ', extends = '»', trail = '-', precedes = '«', eol = '↲', nbsp = '%', space = '.'
}
-- ウィンドウ幅より長い行は折り返して、次の行に続けて表示す
set.wrap = true
-- 新しい行のインデントを現在行と同じにする
set.smartindent = true
-- コマンド行の長さ
set.cmdheight = 2
-- カラムを表示
set.signcolumn = 'yes'
-- set signcolumn=yes
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
