-- キーマッピング
-- 設定例
-- ---------------------------------------------------------
--   コマンド    | ノーマル | 挿入 | コマンド | ビジュアル |
-- ---------------------------------------------------------
-- map /noremap  |    @@    |  --  |    --    |     @@     |
-- ---------------------------------------------------------
-- nmap/nnoremap |    @@    |  --  |    --    |     --     |
-- ---------------------------------------------------------
-- imap/inoremap |    --    |  @@  |    --    |     --     |
-- ---------------------------------------------------------
-- cmap/cnoremap |    --    |  --  |    @@    |     --     |
-- ---------------------------------------------------------
-- vmap/vnoremap |    --    |  --  |    --    |     @@     |
-- ---------------------------------------------------------
-- map!/noremap! |    --    |  @@  |    @@    |     --     |
-- ---------------------------------------------------------
-- ([n/v/c/i][nore]map]) <オプション> 入力する操作 Vimが解釈する操作
-- noremap は再帰的に定義しない。
-- map は再帰的に定義する。
-- 詳しくは→ http://cocopon.me/blog/?p=3871
-- 確認する場合:map

-- キーマッピング設定

local g = vim.g
local api = vim.api

-- <leader>キーを変更 (default: \)
g.mapleader = ' '
g.maplocalleader = ' '

-- 移動系
-- 行頭と行末への移動
api.nvim_set_keymap('', '0', '$', { noremap = true, silent = true })
api.nvim_set_keymap('', '1', '0', { noremap = true, silent = true })
-- 表示上の移動を可能にする
api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gj', 'j', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gk', 'k', { noremap = true, silent = true })
-- 水平方向の移動を簡単にする
api.nvim_set_keymap('n', 'zl', 'zL', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'zh', 'zH', { noremap = true, silent = true })
-- 挿入モードでの移動
api.nvim_set_keymap('i', '<c-f>', '<right>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-b>', '<left>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-a>', '<home>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<c-e>', '<end>', { noremap = true, silent = true })
api.nvim_set_keymap('i', 'jj', '<esc>:<c-u>w<cr>', { noremap = true, silent = true })

-- 編集系
-- ;と:を入れ替
api.nvim_set_keymap('', ';', ':', { noremap = true, silent = false })
api.nvim_set_keymap('', ':', ';', { noremap = true, silent = false })
-- キー置換
api.nvim_set_keymap('', ',h', '^', { noremap = true, silent = true })
api.nvim_set_keymap('', ',l', '$', { noremap = true, silent = true })
api.nvim_set_keymap('', ',m', '%', { noremap = true, silent = true })
api.nvim_set_keymap('n', ',/', ';', { noremap = true, silent = true })
-- ノーマルモードでも改行可能
api.nvim_set_keymap('n', '<cr>', 'i<cr><esc>', { noremap = true, silent = true })
-- 保存
api.nvim_set_keymap('n', ',w', ':w<cr>', { noremap = true, silent = true })
-- 検索後にジャンプした際に検索単語を画面中央に持ってくる
api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })
api.nvim_set_keymap('n', '*', '*zz', { noremap = true, silent = true })
api.nvim_set_keymap('n', '#', '#zz', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'g*', 'g*zz', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'g#', 'g#zz', { noremap = true, silent = true })
-- 検索結果のハイライトをC-h連打でクリアする
api.nvim_set_keymap('n', '<esc><esc>', ':<c-u>nohlsearch<cr>', { noremap = true, silent = true })
-- vを二回で行末まで選択
api.nvim_set_keymap('v', 'v', '$h', { noremap = true, silent = true })
-- tabにて対応ペアにジャンプ
api.nvim_set_keymap('n', '<tab>', '%', { noremap = true, silent = true })
api.nvim_set_keymap('v', '<tab>', '%', { noremap = true, silent = true })

-- 補助系
-- ctrl-v で insert/command モードで貼り付け
api.nvim_set_keymap('i', '<c-v>', '<eSC>"*pa', { noremap = true, silent = true })
api.nvim_set_keymap('c', '<c-v>', '<C-r>+', { noremap = true, silent = true })
-- Yで行末までヤンク
api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })
-- カーソル位置の単語をyankする
api.nvim_set_keymap('n', 'vy', 'viwy', { noremap = true, silent = true })
-- カーソル位置の単語をyankした文字に置き換える
api.nvim_set_keymap('n', 'vp', 'viwpviwy', { noremap = true, silent = true })
-- カーソル下の単語を * で検索
api.nvim_set_keymap('v', '*', [["vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>]], { noremap = true, silent = true })
-- コマンドモード時のカーソル移動
api.nvim_set_keymap('c', '<c-a>', '<home>', { noremap = true, silent = false })
api.nvim_set_keymap('c', '<c-b>', '<left>', { noremap = true, silent = false })
api.nvim_set_keymap('c', '<c-d>', '<delete>', { noremap = true, silent = false })
api.nvim_set_keymap('c', '<c-e>', '<end>', { noremap = true, silent = false })
api.nvim_set_keymap('c', '<c-f>', '<right>', { noremap = true, silent = false })
api.nvim_set_keymap('c', '<c-n>', '<down>', { noremap = true, silent = false })
api.nvim_set_keymap('c', '<c-p>', '<up>', { noremap = true, silent = false })
-- 辞書
api.nvim_set_keymap('n', ',?', ':!open dict://<cword><cr>', { noremap = true, silent = true })

-- ウィンドウ
-- ウィンドウを分割
api.nvim_set_keymap('n', 'sp', ':<c-u>sp<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'sv', ':<c-u>vs<cr>', { noremap = true, silent = true })
-- 分割したウィンドウ間を移動
api.nvim_set_keymap('n', 'sj', '<c-w>j<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'sk', '<c-w>k<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'sl', '<c-w>l<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'sh', '<c-w>h<cr>', { noremap = true, silent = true })
-- ウィンドウを閉じる
api.nvim_set_keymap('n', 'sc', '<c-w>c<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'so', '<c-w>o<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'sq', ':<c-u>q<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'ss', ':<c-u>w<cr>', { noremap = true, silent = true })

-- タブ
-- 新規タブ
api.nvim_set_keymap('n', 'tn', ':<c-u>tabnew<cr>', { noremap = true, silent = true })
-- 前のタブに切り替え
api.nvim_set_keymap('n', '[t', 'gT', { noremap = true, silent = true })
-- 次のタブに切り替え
api.nvim_set_keymap('n', ']t', 'gt', { noremap = true, silent = true })

-- バッファ
-- バッファを閉じる
api.nvim_set_keymap('n', 'bq', ':<c-u>bd<cr>', { noremap = true, silent = true })
-- バッファリストの1つ前のバッファを開く
-- api.nvim_set_keymap('n', 'b[', ':bprevious<cr>', { noremap = true, silent = true })
-- バッファリストの次のバッファを開く
-- api.nvim_set_keymap('n', 'b]', ':bnext<cr>', { noremap = true, silent = true })
-- 直前のバッファを開く
api.nvim_set_keymap('n', 'bb', ':b#<cr>', { noremap = true, silent = true })
-- バッファリストの先頭を開く
api.nvim_set_keymap('n', 'bf', ':bf<cr>', { noremap = true, silent = true })
-- バッファリストの最後を開く
api.nvim_set_keymap('n', 'bl', ':bl<cr>', { noremap = true, silent = true })
--変更中の次のバッファへ移動
api.nvim_set_keymap('n', 'bm', ':bm<cr>', { noremap = true, silent = true })
-- カレントのバッファを閉じてバッファリストから削除
api.nvim_set_keymap('n', 'bd', ':bdelete<cr>', { noremap = true, silent = true })


-- その他
-- バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
api.nvim_set_keymap('c', [[/]], [[getcmdtype() == '/' ? '\/' : '/']], { noremap = true, silent = true, expr = true })
api.nvim_set_keymap('c', [[?]], [[getcmdtype() == '?' ? '\?' : '?']], { noremap = true, silent = true, expr = true })
api.nvim_set_keymap('v', '{', [["zdi{<c-r>z}<esc>]], { noremap = true, silent = true })
api.nvim_set_keymap('v', '[', [["zdi[<c-r>z]<esc>]], { noremap = true, silent = true })
api.nvim_set_keymap('v', '(', [["zdi(<c-r>z)<esc>]], { noremap = true, silent = true })
api.nvim_set_keymap('v', [[']], [["zdi'<c-r>z'<esc>]], { noremap = true, silent = true })
api.nvim_set_keymap('v', [["]], [["zdi'<c-r>z'<esc>]], { noremap = true, silent = true })
api.nvim_set_keymap('v', '--', [["zdi"<c-r>z^V"<esc>]], { noremap = true, silent = true })
api.nvim_set_keymap('n', 'q', 'gq', { noremap = true, silent = true })

-- 保存して閉じる、保存せずに閉じるを無効
api.nvim_set_keymap('n', 'ZZ', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'ZQ', '<nop>', { noremap = true, silent = true })

-- 矢印キー無効
api.nvim_set_keymap('n', '<up>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<down>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<left>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<right>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<up>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<down>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<left>', '<nop>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<right>', '<nop>', { noremap = true, silent = true })
