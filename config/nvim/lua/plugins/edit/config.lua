local M = {}

function M.neogen()
	require("neogen").setup({
		snippet_engine = "luasnip",
		enabled = true,
		input_after_comment = true,
	})
end

function M.surround()
	require("surround").setup({
		context_offset = 100,
		load_autogroups = false,
		mappings_style = "sandwich",
		map_insert_mode = true,
		quotes = { "'", '"' },
		brackets = { "(", "{", "[" },
		space_on_closing_char = false,
		pairs = {
			nestable = {
				b = { "(", ")" },
				s = { "[", "]" },
				B = { "{", "}" },
				a = { "<", ">" },
			},
			linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
		},
		prefix = "s",
	})
end

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

function M.comment()
	require("Comment").setup()
end

function M.colorizer()
	require("colorizer").setup({ "css", "javascript", "typescript" }, {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = true, -- "Name" codes like Blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		rgb_fn = false, -- CSS rgb() and rgba() functions
		hsl_fn = false, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	})
end

function M.yanky()
	require("yanky").setup({
		ring = {
			history_length = 100,
			storage = "shada",
			sync_with_numbered_registers = true,
			cancel_event = "update",
		},
		system_clipboard = { sync_with_ring = true },
	})
end

return M
