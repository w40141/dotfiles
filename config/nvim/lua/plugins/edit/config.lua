local M = {}

function M.eskk()
	local g = vim.g
	g["toggle_markdown_eskk"] = 1
	g["eskk#directory"] = "$XDG_CONFIG_HOME/skk"
	g["eskk#dictionary"] = {
		path = "$XDG_CONFIG_HOME/skk/SKK-JISYO.S",
		sorted = 1,
		encoding = "utf-8",
	}
	g["eskk#large_dictionary"] = {
		path = "$XDG_CONFIG_HOME/skk/SKK-JISYO.L",
		sorted = 1,
		encoding = "utf-8",
	}

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
end

function M.dial()
	local augend = require("dial.augend")
	require("dial.config").augends:register_group({
		-- default augends used when no group name is specified
		default = {
			augend.constant.alias.bool, -- boolean value (true <-> false)
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.date.alias["%Y/%m/%d"],
			augend.date.alias["%Y-%m-%d"],
			augend.date.alias["%m/%d"],
			augend.date.alias["%H:%M"],
			augend.date.alias["%H:%M:%S"],
			augend.constant.alias.ja_weekday_full,
		},
	})
end

return M
