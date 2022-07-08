--  eskk is pure Vim script implementation of input method engine SKK
--  https://github.com/tyru/eskk.vim

--  https://zenn.dev/kouta/articles/87947515bff4da
--  https://hakasenote.hnishi.com/2021/20210105-vim-eskk/


local g = vim.g
g["toggle_markdown_eskk"] = 1
g["eskk#directory"] = "~/.config/eskk"
g["eskk#dictionary"] = { path = "~/.config/eskk/my_jisyo", sorted = 1, encoding = "utf-8" }
g["eskk#large_dictionary"] = { path = "~/.config/eskk/SKK-JISYO.L", sorted = 1, encoding = "utf-8" }

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


local key = vim.api.nvim_set_keymap
key('i', 'jk', [[<plug>(eskk:toggle)]], { noremap = false, silent = true })
key('i', ';;', [[pumvisible() ? coc#_select_confirm() : coc#refresh()]], { expr = true, noremap = true, silent = true })
key('c', 'jk', [[<plug>(eskk:toggle)]], { noremap = false, silent = true })
