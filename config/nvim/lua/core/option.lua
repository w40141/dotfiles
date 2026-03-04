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

opt.cmdheight = 0

-- 不可視文字
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
opt.scrolloff = 999

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
opt.writebackup = false
opt.swapfile = false

-- ===== Blend =====
opt.winblend = 20
opt.pumblend = 20

-- ===== Spell =====
opt.spell = false
opt.spelllang = { "en_us" }

-- ===== Dictionary (guard) =====
do
	local dict = "/usr/share/dict/words"
	if fn.filereadable(dict) == 1 then
		opt.dictionary = dict
	end
end

-- カーソルを行頭、行末で止まらないにする
opt.whichwrap = "b,s,h,l,<,>,[,]"
--
opt.spell = true
opt.spelllang = { "en_us" }
