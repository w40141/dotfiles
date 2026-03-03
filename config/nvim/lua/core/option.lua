local v = vim
local opt = v.opt
local o = v.o
local fn = v.fn

-- ===== FOLD (treesitter if available, otherwise indent) =====
o.foldmethod = "indent"
o.foldlevel = 99
o.foldcolumn = "1"

-- ===== UI / UX =====
opt.mouse = "a"
opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true

-- cmdheight=0 は好みだが事故りやすいので toggle 前提
opt.cmdheight = 0

-- 不可視文字（好み。toggleも用意する）
opt.list = true
opt.listchars = {
	tab = "▸ ",
	extends = "»",
	trail = "-",
	precedes = "«",
	eol = "↲",
	nbsp = "%",
	space = "⋅",
}

-- conceal は filetype で変えるのが安全（ここは最小）
opt.conceallevel = 0

-- ===== Search =====
opt.ignorecase = true
opt.smartcase = true

-- ===== Editing =====
opt.backspace = { "indent", "eol", "start" }
opt.completeopt = { "menuone", "noselect", "popup" }
opt.showmatch = true
opt.startofline = false
opt.history = 10000
opt.virtualedit = "block"
opt.switchbuf = "useopen"

-- scrolloff=999 は撤退。中心寄せはキーでやる。
opt.scrolloff = 10

-- ===== Indent =====
opt.shiftround = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.infercase = true

-- ===== Performance =====
opt.updatetime = 300

-- ===== Clipboard =====
opt.clipboard = "unnamedplus"

-- ===== Backups / Undo =====
-- swap/backup切るなら undo 永続化はほぼ必須
opt.writebackup = false
opt.swapfile = false
-- opt.undofile = true
-- do
-- 	local undodir = fn.stdpath("state") .. "/undo"
-- 	if fn.isdirectory(undodir) == 0 then
-- 		fn.mkdir(undodir, "p")
-- 	end
-- 	opt.undodir = undodir
-- end

-- ===== Blend =====
opt.winblend = 20
opt.pumblend = 20

-- ===== Spell (default OFF, toggle前提) =====
opt.spell = false
opt.spelllang = { "en_us" }

-- ===== Dictionary (guard) =====
do
	local dict = "/usr/share/dict/words"
	if fn.filereadable(dict) == 1 then
		opt.dictionary = dict
	end
end

-- -- 変更中のファイルでも、保存しないで他のファイルを表示する
-- -- opt.hidden = true
-- -- ビープ音すべてを無効にする
-- opt.visualbell = true
-- -- opt.errorbells = false
-- -- タイトルをウィンドウ枠に表示する
-- opt.title = true
--
-- -- opt.shada = ""
-- -- ウィンドウ幅より長い行は折り返して、次の行に続けて表示す
-- -- opt.wrap = true
-- -- 1行が長くても全部表示
-- -- opt.display = "lastline"
-- -- ポップアップメニューの高さを指定
-- -- opt.background = ""
-- -- opt.concealcursor = 'nc'
-- -- opt.fileformats = { "unix", "mac", "dos" }
-- -- 行頭ではshiftwidthの数だけ，以外ではtabstopの数だけindent
-- -- opt.smarttab = true
-- -- opt.backup = false
-- -- カーソルを行頭、行末で止まらないにする
-- opt.whichwrap = "b,s,h,l,<,>,[,]"
-- opt.winblend = 20
-- opt.pumblend = 20
--
-- opt.spell = true
-- opt.spelllang = { "en_us" }
-- -- opt.incsearch = true
--
-- -- dictionary path guard
-- local dict = "/usr/share/dict/words"
-- if v.fn.filereadable(dict) == 1 then
-- 	v.opt.dictionary = dict
-- end
