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
local api = vim.api
local key = vim.api.nvim_set_keymap

-- <leader>キーを変更 (default: \)
g.mapleader = ' '
g.maplocalleader = ' '
key('n', '<leader>', '<nop>', { noremap = true, silent = true} )
key('x', '<leader>', '<nop>', { noremap = true, silent = true} )
key('n', '[dev]', '<nop>', { noremap = true, silent = true} )
key('x', '[dev]', '<nop>', { noremap = true, silent = true} )
key('n', 'm', '[dev]', { noremap = false, silent = true} )
key('x', 'm', '[dev]', { noremap = false, silent = true} )
key('n', '[ff]', '<nop>', { noremap = true, silent = true} )
key('x', '[ff]', '<nop>', { noremap = true, silent = true} )
key('n', '<c-f>', '[ff]', { noremap = false, silent = true} )
key('x', '<c-f>', '[ff]', { noremap = false, silent = true} )

-- [nore]map
-- 行頭と行末への移動
key('', '0', '$', { noremap = true, silent = true })
key('', '1', '0', { noremap = true, silent = true })
-- ;と:を入れ替
key('', ';', ':', { noremap = true, silent = false })
key('', ':', ';', { noremap = true, silent = false })
-- キー置換
key('', ',h', '^', { noremap = true, silent = true })
key('', ',l', '$', { noremap = true, silent = true })
key('', ',m', '%', { noremap = true, silent = true })

-- n[nore]map
-- 表示上の移動を可能にする
key('n', 'j', 'gj', { noremap = true, silent = true })
key('n', 'k', 'gk', { noremap = true, silent = true })
key('n', 'gj', 'j', { noremap = true, silent = true })
key('n', 'gk', 'k', { noremap = true, silent = true })
-- 水平方向の移動を簡単にする
key('n', 'zl', 'zL', { noremap = true, silent = true })
key('n', 'zh', 'zH', { noremap = true, silent = true })
-- キー置換
-- key('n', ',/', ';', { noremap = true, silent = true })
-- カーソル下の単語を小文字にする
key('n', ',u', [[mzg~iw`z<Cmd>delmarks z<CR>]], { noremap = true, silent = true })
-- カーソル下の単語を大文字にする
key('n', ',U', [[mzlbg~l`z<Cmd>delmarks z<CR>]], { noremap = true, silent = true })
-- 保存
key('n', ',w', ':w<cr>', { noremap = true, silent = true })
-- 検索結果のハイライトをC-h連打でクリアする
key('n', ',n', ':<c-u>nohlsearch<cr>', { noremap = true, silent = true })
-- 辞書
key('n', ',?', ':!open dict://<cword><cr>', { noremap = true, silent = true })
-- 検索後にジャンプした際に検索単語を画面中央に持ってくる
key('n', 'n', 'nzz', { noremap = true, silent = true })
key('n', 'N', 'Nzz', { noremap = true, silent = true })
key('n', '*', '*zz', { noremap = true, silent = true })
key('n', '#', '#zz', { noremap = true, silent = true })
key('n', 'g*', 'g*zz', { noremap = true, silent = true })
key('n', 'g#', 'g#zz', { noremap = true, silent = true })
-- カーソル位置の単語をyankした文字に置き換える
key('n', 'vp', 'viwpviwy', { noremap = true, silent = true })
-- カーソル位置の単語をyankする
key('n', 'vy', 'viwy', { noremap = true, silent = true })
-- ノーマルモードでも改行可能
-- key('n', '<cr>', 'i<cr><esc>', { noremap = true, silent = true })
-- tabにて対応ペアにジャンプ
key('n', '<tab>', '%', { noremap = true, silent = true })
-- ウィンドウを分割
key('n', 'sp', ':<c-u>sp<cr>', { noremap = true, silent = true })
key('n', 'sv', ':<c-u>vs<cr>', { noremap = true, silent = true })
-- 分割したウィンドウ間を移動
key('n', 'sj', '<c-w>j<cr>', { noremap = true, silent = true })
key('n', 'sk', '<c-w>k<cr>', { noremap = true, silent = true })
key('n', 'sl', '<c-w>l<cr>', { noremap = true, silent = true })
key('n', 'sh', '<c-w>h<cr>', { noremap = true, silent = true })
-- ウィンドウを閉じる
key('n', 'sc', '<c-w>c<cr>', { noremap = true, silent = true })
-- 現在のウィンドウ以外のウィンドウを閉じる
key('n', 'so', '<c-w>o<cr>', { noremap = true, silent = true })
-- 新規タブ
key('n', 'tn', ':<c-u>tabnew<cr>', { noremap = true, silent = true })
-- バッファを閉じる
key('n', 'bq', ':<c-u>bd<cr>', { noremap = true, silent = true })
-- 直前のバッファを開く
key('n', 'bb', ':b#<cr>', { noremap = true, silent = true })
-- バッファリストの先頭を開く
key('n', 'bf', ':bf<cr>', { noremap = true, silent = true })
-- バッファリストの最後を開く
key('n', 'bl', ':bl<cr>', { noremap = true, silent = true })
--変更中の次のバッファへ移動
key('n', 'bm', ':bm<cr>', { noremap = true, silent = true })
-- レジスタを汚さない削除
-- key('n', 'x', '_x', { noremap = true, silent =true })
-- key('n', 'X', '_X', { noremap = true, silent =true })
-- 保存して閉じる、保存せずに閉じるを無効
key('n', 'ZZ', '<nop>', { noremap = true, silent = true })
key('n', 'ZQ', '<nop>', { noremap = true, silent = true })
-- バッファリストの1つ前のバッファを開く
-- key('n', '[b', ':bprevious<cr>', { noremap = true, silent = true })
-- バッファリストの次のバッファを開く
-- key('n', ']b', ':bnext<cr>', { noremap = true, silent = true })
-- 前のタブに切り替え
key('n', '[t', 'gT', { noremap = true, silent = true })
-- 次のタブに切り替え
key('n', ']t', 'gt', { noremap = true, silent = true })
-- 矢印キー無効
key('n', '<up>', '<nop>', { noremap = true, silent = true })
key('n', '<down>', '<nop>', { noremap = true, silent = true })
key('n', '<left>', '<nop>', { noremap = true, silent = true })
key('n', '<right>', '<nop>', { noremap = true, silent = true })

-- i[nore]map
-- 挿入モードでの移動
key('i', '<c-a>', '<home>', { noremap = true, silent = true })
key('i', '<c-b>', '<left>', { noremap = true, silent = true })
key('i', '<c-e>', '<end>', { noremap = true, silent = true })
key('i', '<c-f>', '<right>', { noremap = true, silent = true })
-- 挿入モードでのesc
key('i', 'jj', '<esc>', { noremap = true, silent = true })
-- ctrl-v で insert モードで貼り付け
key('i', '<c-v>', '<eSC>"*pa', { noremap = true, silent = true })
-- 矢印キー無効
key('i', '<up>', '<nop>', { noremap = true, silent = true })
key('i', '<down>', '<nop>', { noremap = true, silent = true })
key('i', '<left>', '<nop>', { noremap = true, silent = true })
key('i', '<right>', '<nop>', { noremap = true, silent = true })

-- v[nore]map
-- vを二回で行末まで選択
key('v', 'v', '$h', { noremap = true, silent = true })
-- レジスタを汚さない削除
-- key('v', 'x', '_x', { noremap = true, silent =true })
-- key('v', 'X', '_X', { noremap = true, silent =true })
-- 選択下を記号で囲う
key('v', '{', [["zdi{<c-r>z}<esc>]], { noremap = true, silent = true })
key('v', '[', [["zdi[<c-r>z]<esc>]], { noremap = true, silent = true })
key('v', '(', [["zdi(<c-r>z)<esc>]], { noremap = true, silent = true })
key('v', [[']], [["zdi'<c-r>z'<esc>]], { noremap = true, silent = true })
key('v', [["]], [["zdi'<c-r>z'<esc>]], { noremap = true, silent = true })
key('v', '--', [["zdi"<c-r>z^V"<esc>]], { noremap = true, silent = true })
-- tabにて対応ペアにジャンプ
key('v', '<tab>', '%', { noremap = true, silent = true })

-- c[nore]map
-- コマンドモード時のカーソル移動
key('c', '<c-a>', '<home>', { noremap = true, silent = false })
key('c', '<c-b>', '<left>', { noremap = true, silent = false })
key('c', '<c-d>', '<delete>', { noremap = true, silent = false })
key('c', '<c-e>', '<end>', { noremap = true, silent = false })
key('c', '<c-f>', '<right>', { noremap = true, silent = false })
key('c', '<c-n>', '<down>', { noremap = true, silent = false })
key('c', '<c-p>', '<up>', { noremap = true, silent = false })
-- ctrl-v で command モードで貼り付け
key('c', '<c-v>', '<C-r>+', { noremap = true, silent = true })
-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
key('c', [[/]], [[getcmdtype() == '/' ? '\/' : '/']], { noremap = true, silent = false, expr = true })
key('c', [[?]], [[getcmdtype() == '?' ? '\?' : '?']], { noremap = true, silent = false, expr = true })
