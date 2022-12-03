local g = vim.g
g["toggle_markdown_eskk"] = 1
g["eskk#directory"] = "$XDG_CONFIG_HOME/skk"
g["eskk#dictionary"] = { path = "$XDG_CONFIG_HOME/skk/my_jisyo", sorted = 1, encoding = "utf-8" }
g["eskk#large_dictionary"] = { path = "$XDG_CONFIG_HOME/skk/SKK-JISYO.L", sorted = 1, encoding = "utf-8" }

-- 漢字変換した時に候補が1つの場合、自動的に確定する
g["eskk#kakutei_when_unique_candidate"] = 1
-- neocompleteを入れないと、1にすると動作しなくなるため0推奨
g["eskk#enable_completion"] = 0
-- デフォルトのマッピングを削除
g["eskk#no_default_mappings"] = 1
-- ノーマルモードに戻るとeskkモードを初期値にする
g["eskk#keep_state"] = 0
-- 漢字変換を確定しても改行しない。
g["eskk#egg_like_newline"] = 1
g["eskk#log_cmdline_level"] = 3

-- 表示文字を変更
g["eskk#marker_henkan"] = "[変換]"
g["eskk#marker_henkan_select"] = "[選択]"
g["eskk#marker_okuri"] = "[送り]"
g["eskk#marker_jisyo_touroku"] = "[辞書]"

local key = vim.keymap.set
key('i', 'jk', "<plug>(eskk:toggle)", { noremap = false, silent = false })
key('c', 'jk', "<plug>(eskk:toggle)", { noremap = false, silent = false })
