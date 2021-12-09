" 表示設定

lua << EOF
-- 行番号を表示する
vim.o.number = true
-- タイトルをウィンドウ枠に表示する
vim.o.title = true
-- 不可視文字を表示
vim.o.list = true
vim.opt.listchars = {
    tab = '▸ ', extends = '»', trail = '-', precedes = '«', eol = '↲', nbsp = '%', space = '.'
}
-- ウィンドウ幅より長い行は折り返して、次の行に続けて表示す
vim.o.wrap = true
-- 新しい行のインデントを現在行と同じにする
vim.o.smartindent = true
-- コマンド行の長さ
vim.o.cmdheight = 2
-- カラムを表示
vim.o.signcolumn = 'yes'
-- set signcolumn=yes
-- エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
vim.o.laststatus = 2
-- ステータスラインにコマンドを表示
vim.o.showcmd = true
-- 1行が長くても全部表示
vim.o.display = 'lastline'
-- set display=lastline
-- ポップアップメニューの高さを指定
vim.o.pumheight = 30
-- カーソル行の強調表示
vim.o.cursorline = true
-- コマンドラインでmodeの表示をしない
vim.o.showmode = false
-- 日本語help
vim.o.helplang = 'ja'
vim.o.background = 'dark'
-- 文字を隠す
if vim.fn.has('conceal') == 1 then
    vim.o.conceallevel = 1
    vim.o.concealcursor = 'c'
end
EOF

autocmd MyAutoCmd ColorScheme * highlight Visual ctermbg=225
