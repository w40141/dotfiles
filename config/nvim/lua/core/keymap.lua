-- キーマッピング
-- 設定例
-- モード     | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- コマンド   +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map  | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map! |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

-- ([n/v/c/i][nore]map]) <オプション> 入力する操作 Vimが解釈する操作
-- noremap は再帰的に定義しない。
-- map は再帰的に定義する。 詳しくは→ http://cocopon.me/blog/?p=3871
-- 確認する場合:map

-- キーマッピング設定

local v = vim
local g = v.g
local fn = v.fn
local key = v.keymap.set

-- <leader>キーを変更 (default: \)
g.mapleader = " "
g.maplocalleader = " "
key("n", " ", "")
key("x", " ", "")

key("n", "<leader>", "<nop>")
key("x", "<leader>", "<nop>")

key("n", "[ff]", "<nop>")
key("x", "[ff]", "<nop>")
key("n", "<c-f>", "[ff]", { remap = true })
key("x", "<c-f>", "[ff]", { remap = true })

key("n", "[dev]", "<nop>")
key("x", "[dev]", "<nop>")
key("n", "m", "[dev]", { remap = true })
key("x", "m", "[dev]", { remap = true })

key("n", "[tr]", "<nop>")
key("x", "[tr]", "<nop>")
key("n", "<c-m>", "[tr]", { remap = true })
key("x", "<c-m>", "[tr]", { remap = true })

-- [nore]map
-- 行頭と行末への移動
key("", "0", "$")
key("", "1", "0")
-- ;と:を入れ替
key("", ";", ":")
key("", ":", ";")
-- キー置換
key("", ",h", "^")
key("", ",l", "$")
key("", ",p", "%")
-- ヤンク
key("", "gy", '"+y')

-- n[nore]map
-- 表示上の移動を可能にする
key("n", "j", "gj")
key("n", "k", "gk")
key("n", "gj", "j")
key("n", "gk", "k")
-- 水平方向の移動を簡単にする
key("n", "zl", "zL")
key("n", "zh", "zH")
-- キー置換
-- key('n', ',/', ';')
-- カーソル下の単語を小文字にする
key("n", ",u", [[mzg~iw`z<Cmd>delmarks z<CR>]])
-- カーソル下の単語を大文字にする
key("n", ",U", [[mzlbg~l`z<Cmd>delmarks z<CR>]])
-- 保存
key("n", ",w", ":w<cr>")
-- 検索結果のハイライトをC-h連打でクリアする
-- key("n", ",n", ":<c-u>nohlsearch<cr>")
-- 辞書
key("n", ",?", ":!open dict://<cword><cr>")
-- 検索後にジャンプした際に検索単語を画面中央に持ってくる
key("n", "n", "nzz")
key("n", "N", "Nzz")
key("n", "*", "*zz")
key("n", "#", "#zz")
key("n", "g*", "g*zz")
key("n", "g#", "g#zz")
-- カーソル位置の単語をyankした文字に置き換える
key("n", "vp", "viwpviwy")
-- カーソル位置の単語をyankする
key("n", "vy", "viwy")
-- ノーマルモードでも改行可能
key("n", "<cr>", "i<cr><esc>")
-- tabにて対応ペアにジャンプ
key("n", "<tab>", "%")
-- ウィンドウを分割
key("n", "sp", ":<c-u>sp<cr>")
key("n", "sv", ":<c-u>vs<cr>")
-- 分割したウィンドウ間を移動
key("n", "sw", "<c-w>w<cr>")
key("n", "sj", "<c-w>j<cr>")
key("n", "sk", "<c-w>k<cr>")
key("n", "sl", "<c-w>l<cr>")
key("n", "sh", "<c-w>h<cr>")
-- ウィンドウを閉じる
key("n", "sc", "<c-w>c<cr>")
-- 現在のウィンドウ以外のウィンドウを閉じる
key("n", "so", "<c-w>o<cr>")
-- 新規タブ
-- key('n', 'tn', ':<c-u>tabnew<cr>')
-- バッファを閉じる
-- key('n', 'qh', ':<c-u>bd<cr>')
-- key('n', 'ql', ':<c-u>Bd<cr>')
-- 直前のバッファを開く
-- key('n', 'bb', ':b#<cr>')
-- バッファリストの先頭を開く
-- key('n', 'bf', ':bf<cr>')
-- バッファリストの最後を開く
-- key('n', 'bl', ':bl<cr>')
--変更中の次のバッファへ移動
key("n", "qm", ":<c-u>bm<cr>")
-- 保存して閉じる、保存せずに閉じるを無効
key("n", "ZZ", "<nop>")
key("n", "ZQ", "<nop>")
-- バッファリストの1つ前のバッファを開く
-- key('n', '[b', ':bprevious<cr>')
-- バッファリストの次のバッファを開く
-- key('n', ']b', ':bnext<cr>')
-- 前のタブに切り替え
key("n", "[t", "gT")
-- 次のタブに切り替え
key("n", "]t", "gt")

-- i[nore]map
-- 挿入モードでの移動
key("i", "<c-a>", "<home>")
key("i", "<c-b>", "<left>")
key("i", "<c-e>", "<end>")
key("i", "<c-f>", "<right>")
-- 挿入モードでのesc
key("i", "jj", "<esc>")
-- ctrl-v で insert モードで貼り付け
key("i", "<c-v>", '<eSC>"*pa')

-- 矢印キー無効
key("n", "<up>", "<nop>")
key("n", "<down>", "<nop>")
key("n", "<left>", "<nop>")
key("n", "<right>", "<nop>")
key("i", "<up>", "<nop>")
key("i", "<down>", "<nop>")
key("i", "<left>", "<nop>")
key("i", "<right>", "<nop>")

-- v[nore]map
-- vを二回で行末まで選択
key("v", "v", "$h")
-- レジスタを汚さない削除
key("n", "x", '"_x')
key("n", "X", '"_X')
key("v", "x", '"_x')
key("v", "X", '"_X')
-- tabにて対応ペアにジャンプ
key("v", "<tab>", "%")

-- c[nore]map
-- コマンドモード時のカーソル移動
key("c", "<c-a>", "<home>")
key("c", "<c-b>", "<left>")
key("c", "<c-d>", "<delete>")
key("c", "<c-e>", "<end>")
key("c", "<c-f>", "<right>")
key("c", "<c-n>", "<down>")
key("c", "<c-p>", "<up>")
-- ctrl-v で command モードで貼り付け
key("c", "<c-v>", "<C-r>+")
-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
key("c", "/", function()
	return fn.getcmdtype() == "/" and "\\/" or "/"
end, { expr = true })
key("c", "?", function()
	return fn.getcmdtype() == "?" and "\\?" or "?"
end, { expr = true })

-- ターミナル
key("t", "jj", "<C-\\><C-N>")
key("t", "<C-j>q", "<C-\\><C-n>:q<CR>")
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
