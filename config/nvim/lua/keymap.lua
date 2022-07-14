-- キーマッピング
-- 設定例
--        モード  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- コマンド       +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

-- ([n/v/c/i][nore]map]) <オプション> 入力する操作 Vimが解釈する操作
-- noremap は再帰的に定義しない。
-- map は再帰的に定義する。
-- 詳しくは→ http://cocopon.me/blog/?p=3871
-- 確認する場合:map

-- キーマッピング設定

local g = vim.g
-- local key = vim.keymap.set
local key = vim.api.nvim_set_keymap

-- <leader>キーを変更 (default: \)
g.mapleader = ' '
g.maplocalleader = ' '

local optstt = { noremap = true, silent = true }
local optsft = { noremap = false, silent = true }
local optstf = { noremap = true, silent = false }
local optsff = { noremap = false, silent = false }

key('n', '<leader>', '<nop>', optstt)
key('x', '<leader>', '<nop>', optstt)
key('n', '[ff]', '<nop>', optstt)
key('x', '[ff]', '<nop>', optstt)
key('n', '<c-f>', '[ff]', optsft)
key('x', '<c-f>', '[ff]', optsft)
key('n', '[dev]', '<nop>', optstt)
key('x', '[dev]', '<nop>', optstt)
key('n', 'm', '[dev]', optsft)
key('x', 'm', '[dev]', optsft)
key('n', '[tl]', '<nop>', optstt)
key('x', '[tl]', '<nop>', optstt)
key('n', 't', '[tl]', optsft)
key('x', 't', '[tl]', optsft)

-- [nore]map
-- 行頭と行末への移動
key('', '0', '$', optstt)
key('', '1', '0', optstt)
-- ;と:を入れ替
key('', ';', ':', optstf)
key('', ':', ';', optstf)
-- キー置換
key('', ',h', '^', optstt)
key('', ',l', '$', optstt)
key('', ',p', '%', optstt)

-- n[nore]map
-- 表示上の移動を可能にする
key('n', 'j', 'gj', optstt)
key('n', 'k', 'gk', optstt)
key('n', 'gj', 'j', optstt)
key('n', 'gk', 'k', optstt)
-- 水平方向の移動を簡単にする
key('n', 'zl', 'zL', optstt)
key('n', 'zh', 'zH', optstt)
-- キー置換
-- key('n', ',/', ';', optstt)
-- カーソル下の単語を小文字にする
key('n', ',u', [[mzg~iw`z<Cmd>delmarks z<CR>]], optstt)
-- カーソル下の単語を大文字にする
key('n', ',U', [[mzlbg~l`z<Cmd>delmarks z<CR>]], optstt)
-- 保存
key('n', ',w', ':w<cr>', optstt)
-- 検索結果のハイライトをC-h連打でクリアする
key('n', ',n', ':<c-u>nohlsearch<cr>', optstt)
-- 辞書
key('n', ',?', ':!open dict://<cword><cr>', optstt)
-- 検索後にジャンプした際に検索単語を画面中央に持ってくる
key('n', 'n', 'nzz', optstt)
key('n', 'N', 'Nzz', optstt)
key('n', '*', '*zz', optstt)
key('n', '#', '#zz', optstt)
key('n', 'g*', 'g*zz', optstt)
key('n', 'g#', 'g#zz', optstt)
-- カーソル位置の単語をyankした文字に置き換える
key('n', 'vp', 'viwpviwy', optstt)
-- カーソル位置の単語をyankする
key('n', 'vy', 'viwy', optstt)
-- ノーマルモードでも改行可能
key('n', '<cr>', 'i<cr><esc>', optstt)
-- tabにて対応ペアにジャンプ
key('n', '<tab>', '%', optstt)
-- ウィンドウを分割
key('n', 'sp', ':<c-u>sp<cr>', optstt)
key('n', 'sv', ':<c-u>vs<cr>', optstt)
-- 分割したウィンドウ間を移動
key('n', 'sw', '<c-w>w<cr>', optstt)
key('n', 'sj', '<c-w>j<cr>', optstt)
key('n', 'sk', '<c-w>k<cr>', optstt)
key('n', 'sl', '<c-w>l<cr>', optstt)
key('n', 'sh', '<c-w>h<cr>', optstt)
-- ウィンドウを閉じる
key('n', 'sc', '<c-w>c<cr>', optstt)
-- 現在のウィンドウ以外のウィンドウを閉じる
key('n', 'so', '<c-w>o<cr>', optstt)
-- 新規タブ
-- key('n', 'tn', ':<c-u>tabnew<cr>', optstt)
-- バッファを閉じる
key('n', 'qb', ':<c-u>bd<cr>', optstt)
-- 直前のバッファを開く
-- key('n', 'bb', ':b#<cr>', optstt)
-- バッファリストの先頭を開く
-- key('n', 'bf', ':bf<cr>', optstt)
-- バッファリストの最後を開く
-- key('n', 'bl', ':bl<cr>', optstt)
--変更中の次のバッファへ移動
key('n', 'qm', ':<c-u>bm<cr>', optstt)
-- 保存して閉じる、保存せずに閉じるを無効
key('n', 'ZZ', '<nop>', optstt)
key('n', 'ZQ', '<nop>', optstt)
-- バッファリストの1つ前のバッファを開く
-- key('n', '[b', ':bprevious<cr>', optstt)
-- バッファリストの次のバッファを開く
-- key('n', ']b', ':bnext<cr>', optstt)
-- 前のタブに切り替え
key('n', '[t', 'gT', optstt)
-- 次のタブに切り替え
key('n', ']t', 'gt', optstt)
-- 矢印キー無効
key('n', '<up>', '<nop>', optstt)
key('n', '<down>', '<nop>', optstt)
key('n', '<left>', '<nop>', optstt)
key('n', '<right>', '<nop>', optstt)

-- i[nore]map
-- 挿入モードでの移動
key('i', '<c-a>', '<home>', optstt)
key('i', '<c-b>', '<left>', optstt)
key('i', '<c-e>', '<end>', optstt)
key('i', '<c-f>', '<right>', optstt)
-- 挿入モードでのesc
key('i', 'jj', '<esc>', optstt)
-- ctrl-v で insert モードで貼り付け
key('i', '<c-v>', '<eSC>"*pa', optstt)
-- 矢印キー無効
key('i', '<up>', '<nop>', optstt)
key('i', '<down>', '<nop>', optstt)
key('i', '<left>', '<nop>', optstt)
key('i', '<right>', '<nop>', optstt)

-- v[nore]map
-- vを二回で行末まで選択
key('v', 'v', '$h', optstt)
-- レジスタを汚さない削除
key('n', 'x', '"_x', optstt)
key('n', 'X', '"_X', optstt)
key('v', 'x', '"_x', optstt)
key('v', 'X', '"_X', optstt)
-- tabにて対応ペアにジャンプ
key('v', '<tab>', '%', optstt)

-- c[nore]map
-- コマンドモード時のカーソル移動
key('c', '<c-a>', '<home>', optstf)
key('c', '<c-b>', '<left>', optstf)
key('c', '<c-d>', '<delete>', optstf)
key('c', '<c-e>', '<end>', optstf)
key('c', '<c-f>', '<right>', optstf)
key('c', '<c-n>', '<down>', optstf)
key('c', '<c-p>', '<up>', optstf)
-- ctrl-v で command モードで貼り付け
key('c', '<c-v>', '<C-r>+', optstt)
-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
key('c', [[/]], [[getcmdtype() == '/' ? '\/' : '/']], { noremap = true, silent = false, expr = true })
key('c', [[?]], [[getcmdtype() == '?' ? '\?' : '?']], { noremap = true, silent = false, expr = true })
