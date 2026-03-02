local v = vim
local g = v.g
local fn = v.fn
local key = v.keymap.set

-- Leader
g.mapleader = " "
g.maplocalleader = ","

key({ "n", "x" }, " ", "<nop>")
key({ "n", "x" }, ",", "<nop>")

-- <leader>f = find
key({ "n", "x" }, "[FF]", "<nop>")
key({ "n", "x" }, "<leader>f", "[FF]", { remap = true })

-- <leader>m = dev
key({ "n", "x" }, "[DEV]", "<nop>")
key({ "n", "x" }, "<leader>m", "[DEV]", { remap = true })

-- <leader>t = toggle/tools
key({ "n", "x" }, "[TR]", "<nop>")
key({ "n", "x" }, "<leader>t", "[TR]", { remap = true })

-- <leader>g = git
key({ "n", "x" }, "[GIT]", "<nop>")
key({ "n", "x" }, "<leader>g", "[GIT]", { remap = true })

-- <leader>b = buffer
key({ "n", "x" }, "[BUF]", "<nop>")
key({ "n", "x" }, "<leader>b", "[BUF]", { remap = true })

-- <leader>w = window
key({ "n", "x" }, "[WIN]", "<nop>")
key({ "n", "x" }, "<leader>w", "[WIN]", { remap = true })

-- ===== Normal =====

-- ;と:を入れ替
key("", ";", ":")
key("", ":", ";")

-- 検索結果の中心寄せ
key("n", "n", "nzz")
key("n", "N", "Nzz")
key("n", "*", "*zz")
key("n", "#", "#zz")
key("n", "g*", "g*zz")
key("n", "g#", "g#zz")

-- 表示行移動
key("n", "j", "gj")
key("n", "k", "gk")

-- 行頭/行末
key("n", "<c-h>", "^")
key("n", "<c-l>", "$")
key("n", "<leader>p", "%")

-- ノーマルモードでも改行可能
key("n", "<cr>", "i<cr><esc>", { desc = "Insert line below" })

-- 置換：カーソル位置の単語をyankした文字列に置換
key("n", "vp", "viwpviwy", { desc = "Replace word with yanked word" })
key("n", "vy", "viwy", { desc = "Yank word" })

-- ノーマルで改行
key("n", "<leader>o", "o<esc>", { desc = "New line below" })
key("n", "<leader>O", "O<esc>", { desc = "New line above" })

-- Tabで対応ペア
key("n", "<tab>", "%", { desc = "Match pair" })

-- ウィンドウ操作
key("n", "[WIN]s", "<cmd>split<cr>", { desc = "Split" })
key("n", "[WIN]v", "<cmd>vsplit<cr>", { desc = "Vsplit" })
key("n", "[WIN]w", "<C-w>w", { desc = "Next window" })
key("n", "[WIN]j", "<C-w>j", { desc = "Win down" })
key("n", "[WIN]k", "<C-w>k", { desc = "Win up" })
key("n", "[WIN]l", "<C-w>l", { desc = "Win right" })
key("n", "[WIN]h", "<C-w>h", { desc = "Win left" })
key("n", "[WIN]c", "<C-w>c", { desc = "Close window" })
key("n", "[WIN]o", "<C-w>o", { desc = "Only window" })

-- タブ移動
key("n", "[t", "gT", { desc = "Prev tab" })
key("n", "]t", "gt", { desc = "Next tab" })

-- 矢印キー無効
key({ "n", "i" }, "<up>", "<nop>")
key({ "n", "i" }, "<down>", "<nop>")
key({ "n", "i" }, "<left>", "<nop>")
key({ "n", "i" }, "<right>", "<nop>")

-- ZZ/ZQ 無効
key("n", "ZZ", "<nop>")
key("n", "ZQ", "<nop>")

-- レジスタを汚さない削除
key("n", "x", '"_x')
key("n", "X", '"_X')

-- -- 新規タブ
-- -- key('n', 'tn', ':<c-u>tabnew<cr>')
-- -- バッファを閉じる
-- -- key('n', 'qh', ':<c-u>bd<cr>')
-- -- key('n', 'ql', ':<c-u>Bd<cr>')
-- -- 直前のバッファを開く
-- -- key('n', 'bb', ':b#<cr>')
-- -- バッファリストの先頭を開く
-- -- key('n', 'bf', ':bf<cr>')
-- -- バッファリストの最後を開く
-- -- key('n', 'bl', ':bl<cr>')
-- --変更中の次のバッファへ移動
-- key("n", "qm", ":<c-u>bm<cr>")
-- -- バッファリストの1つ前のバッファを開く
-- -- key('n', '[b', ':bprevious<cr>')
-- -- バッファリストの次のバッファを開く
-- -- key('n', ']b', ':bnext<cr>')

-- Yank
key({ "n", "x" }, "gy", '"+y', { desc = "Yank to system clipboard" })

-- ===== Visual =====
key("v", "v", "$h")
key("v", "<tab>", "%")
key("v", "x", '"_x')
key("v", "X", '"_X')

-- ===== Insert =====
key("i", "<c-a>", "<home>")
key("i", "<c-b>", "<left>")
key("i", "<c-e>", "<end>")
key("i", "<c-f>", "<right>")
key("i", "jj", "<esc>")

-- 入力した単語を大文字化
key("i", "<C-l>", function()
	local line = fn.getline(".")
	local col = fn.getpos(".")[3]
	local substring = line:sub(1, col - 1)
	local result = fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
	return "<C-w>" .. result:upper()
end, { expr = true, desc = "Uppercase last word" })

-- ===== Command-line =====
key("c", "<c-a>", "<home>")
key("c", "<c-b>", "<left>")
key("c", "<c-d>", "<delete>")
key("c", "<c-e>", "<end>")
key("c", "<c-f>", "<right>")
key("c", "<c-n>", "<down>")
key("c", "<c-p>", "<up>")
key("c", "<c-v>", "<C-r>+")

key("c", "/", function()
	return fn.getcmdtype() == "/" and "\\/" or "/"
end, { expr = true })
key("c", "?", function()
	return fn.getcmdtype() == "?" and "\\?" or "?"
end, { expr = true })

-- ===== Terminal =====
key("t", "jj", "<C-\\><C-n>")
key("t", "<C-j>q", "<C-\\><C-n>:q<CR>")

-- ===== URL aware gf =====
key("n", "gf", function()
	local os_name = v.loop.os_uname().sysname
	local cfile = fn.expand("<cfile>")
	if cfile:match("^https?://") then
		if os_name == "Darwin" then
			v.ui.open(cfile)
		else
			fn.system({ "explorer.exe", cfile })
		end
	else
		v.cmd("normal! gF")
	end
end)
-- Windows判定が雑だったので改善（Wslも想定）
-- key("n", "gf", function()
-- 	local cfile = fn.expand("<cfile>")
-- 	if cfile:match("^https?://") then
-- 		local uname = v.loop.os_uname()
-- 		local sys = uname.sysname
-- 		if sys == "Darwin" then
-- 			v.ui.open(cfile)
-- 		elseif sys:match("Windows") then
-- 			fn.system({ "cmd.exe", "/c", "start", "", cfile })
-- 		else
-- 			-- Linux/WSL: xdg-open があればそれ
-- 			if fn.executable("xdg-open") == 1 then
-- 				fn.system({ "xdg-open", cfile })
-- 			else
-- 				-- 最後の手段：何もしない
-- 				v.notify("No opener found for URL", v.log.levels.WARN)
-- 			end
-- 		end
-- 	else
-- 		v.cmd("normal! gF")
-- 	end
-- end, { desc = "gf (open URL or file)" })

-- ===== Toggles =====
local function toggle_opt(name, on, off)
	local cur = v.opt[name]:get()
	if cur == on then
		v.opt[name] = off
	else
		v.opt[name] = on
	end
end

key("n", "[TR]s", function()
	v.opt.spell = not v.opt.spell:get()
end, { desc = "Toggle spell" })

key("n", "[TR]l", function()
	v.opt.list = not v.opt.list:get()
end, { desc = "Toggle listchars" })

key("n", "[TR]c", function()
	-- conceallevel 0 <-> 2
	toggle_opt("conceallevel", 2, 0)
end, { desc = "Toggle conceal" })

key("n", "[TR]C", function()
	-- cmdheight 0 <-> 1
	toggle_opt("cmdheight", 0, 1)
end, { desc = "Toggle cmdheight 0/1" })

key("n", "[TR]z", function()
	-- 一時的に中心へ寄せたい時用（scrolloffは適度にしておく）
	v.cmd("normal! zz")
end, { desc = "Center cursor" })

-- カーソル下の単語を小文字にする
key("n", "<leader>u", [[mzg~iw`z<Cmd>delmarks z<cr>]])
-- カーソル下の単語を大文字にする
key("n", "<leader>U", [[mzlbg~l`z<Cmd>delmarks z<cr>]])
-- -- 検索結果のハイライトをC-h連打でクリアする
key("n", ",n", ":<c-u>nohlsearch<cr>")

-- ctrl-v で insert モードで貼り付け
key("i", "<c-v>", '<esc>"*pa')
