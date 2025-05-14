local M = {}

local function ufo(name)
	return function()
		return require("ufo")[name]()
	end
end

M.ufo = {
	{ "zR", ufo("openAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを開く" } },
	{ "zM", ufo("closeAllFolds"), { desc = "[nvim-ufo] すべての折り畳みを閉じる" } },
	{ "zr", ufo("openFoldsExceptKinds"), { desc = "[nvim-ufo] 指定以外の折り畳みを開く" } },
	{ "zm", ufo("closeFoldsWith"), { desc = "[nvim-ufo] 指定レベル以上の折り畳みを閉じる" } },
}

M.yanky = {
	{ "p", "<Plug>(YankyPutAfter)", { "n", "x" }, { desc = "[yanky] カーソルの後ろにペースト" } },
	{ "P", "<Plug>(YankyPutBefore)", { "n", "x" }, { desc = "[yanky] カーソルの前にペースト" } },
	{
		"gp",
		"<Plug>(YankyGPutAfter)",
		{ "n", "x" },
		{ desc = "[yanky] セクションの後ろにペースト" },
	},
	{
		"gP",
		"<Plug>(YankyGPutBefore)",
		{ "n", "x" },
		{ desc = "[yanky] セクションの前にペースト" },
	},
	{ "<c-n>", "<Plug>(YankyPreviousEntry)", { desc = "[yanky] 前のヤンク履歴を選択" } },
	{ "<c-p>", "<Plug>(YankyNextEntry)", { desc = "[yanky] 次のヤンク履歴を選択" } },
	{ "<c-y>", "<Cmd>YankyRingHistory<CR>", { desc = "[yanky] ヤンク履歴を表示" } },
	{
		"]p",
		"<Plug>(YankyPutIndentAfterLinewise)",
		{ desc = "[yanky] 後ろにインデント付きでペースト" },
	},
	{
		"[p",
		"<Plug>(YankyPutIndentBeforeLinewise)",
		{ desc = "[yanky] 前にインデント付きでペースト" },
	},
	{
		"]P",
		"<Plug>(YankyPutIndentAfterLinewise)",
		{ desc = "[yanky] セクションの後ろにインデント付きでペースト" },
	},
	{
		"[P",
		"<Plug>(YankyPutIndentBeforeLinewise)",
		{ desc = "[yanky] セクションの前にインデント付きでペースト" },
	},
	{
		">p",
		"<Plug>(YankyPutIndentAfterShiftRight)",
		{ desc = "[yanky] 後ろにインデント付きで右シフト" },
	},
	{
		"<p",
		"<Plug>(YankyPutIndentAfterShiftLeft)",
		{ desc = "[yanky] 後ろにインデント付きで左シフト" },
	},
	{
		">P",
		"<Plug>(YankyPutIndentBeforeShiftRight)",
		{ desc = "[yanky] セクションの後ろにインデント付きで右シフト" },
	},
	{
		"<P",
		"<Plug>(YankyPutIndentBeforeShiftLeft)",
		{ desc = "[yanky] セクションの前にインデント付きで左シフト" },
	},
	{
		"=p",
		"<Plug>(YankyPutAfterFilter)",
		{ desc = "[yanky] 後ろにフィルターを適用してペースト" },
	},
	{
		"=P",
		"<Plug>(YankyPutBeforeFilter)",
		{ desc = "[yanky] 前にフィルターを適用してペースト" },
	},
}

M.dial = {
	{ "<C-a>", "<Plug>(dial-increment)", mode = { "n", "v" }, { desc = "[dial] インクリメント" } },
	{ "<C-x>", "<Plug>(dial-decrement)", mode = { "n", "v" }, { desc = "[dial] デクリメント" } },
	{ "g<C-a>", "g<Plug>(dial-increment)", mode = { "n", "v" }, { desc = "[dial] インクリメント" } },
	{ "g<C-x>", "g<Plug>(dial-decrement)", mode = { "n", "v" }, { desc = "[dial] デクリメント" } },
}

M.textcase = {
	{ "gtt", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "[textcase] Telescope" },

	-- Current word transformations
	{
		"gau",
		"<cmd>lua require('textcase').current_word('to_upper_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Upper Case",
	},
	{
		"gal",
		"<cmd>lua require('textcase').current_word('to_lower_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Lower Case",
	},
	{
		"gas",
		"<cmd>lua require('textcase').current_word('to_snake_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Snake Case",
	},
	{
		"ga-",
		"<cmd>lua require('textcase').current_word('to_dash_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Dash Case",
	}, -- Changed from "gad" to "ga-"
	{
		"gan",
		"<cmd>lua require('textcase').current_word('to_constant_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Constant Case",
	},
	{
		"ga.",
		"<cmd>lua require('textcase').current_word('to_dot_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Dot Case",
	}, -- Changed from "gad" to "ga,"
	{
		"ga;",
		"<cmd>lua require('textcase').current_word('to_comma_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Comma Case",
	}, -- Changed from "ga," to "ga;"
	{
		"gaa",
		"<cmd>lua require('textcase').current_word('to_phrase_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Phrase Case",
	},
	{
		"gac",
		"<cmd>lua require('textcase').current_word('to_camel_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Camel Case",
	},
	{
		"gap",
		"<cmd>lua require('textcase').current_word('to_pascal_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Pascal Case",
	},
	{
		"gat",
		"<cmd>lua require('textcase').current_word('to_title_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Title Case",
	},
	{
		"gaf",
		"<cmd>lua require('textcase').current_word('to_path_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] To Path Case",
	},

	-- LSP rename transformations
	{
		"glu",
		"<cmd>lua require('textcase').lsp_rename('to_upper_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Upper Case",
	},
	{
		"gll",
		"<cmd>lua require('textcase').lsp_rename('to_lower_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Lower Case",
	},
	{
		"gls",
		"<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Snake Case",
	},
	{
		"gld",
		"<cmd>lua require('textcase').lsp_rename('to_dash_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Dash Case",
	},
	{
		"gln",
		"<cmd>lua require('textcase').lsp_rename('to_constant_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Constant Case",
	},
	{
		"gl.",
		"<cmd>lua require('textcase').lsp_rename('to_dot_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Dot Case",
	}, -- Changed from "gaD" to "ga."
	{
		"gl;",
		"<cmd>lua require('textcase').lsp_rename('to_comma_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Comma Case",
	}, -- Changed from "ga," to "ga,"
	{
		"gla",
		"<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Phrase Case",
	},
	{
		"glc",
		"<cmd>lua require('textcase').lsp_rename('to_camel_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Camel Case",
	},
	{
		"glp",
		"<cmd>lua require('textcase').lsp_rename('to_pascal_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Pascal Case",
	},
	{
		"glt",
		"<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Title Case",
	},
	{
		"glf",
		"<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] LSP Rename to Path Case",
	},

	-- Operator pending transformations
	{
		"geu",
		"<cmd>lua require('textcase').operator('to_upper_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Upper Case",
	},
	{
		"gel",
		"<cmd>lua require('textcase').operator('to_lower_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Lower Case",
	},
	{
		"ges",
		"<cmd>lua require('textcase').operator('to_snake_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Snake Case",
	},
	{
		"ge-",
		"<cmd>lua require('textcase').operator('to_dash_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Dash Case",
	}, -- Changed from "ged" to "ge-"
	{
		"gen",
		"<cmd>lua require('textcase').operator('to_constant_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Constant Case",
	},
	{
		"ge.",
		"<cmd>lua require('textcase').operator('to_dot_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Dot Case",
	}, -- Changed from "ged" to "ge."
	{
		"ge;",
		"<cmd>lua require('textcase').operator('to_comma_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Comma Case",
	}, -- Changed from "ge," to "ge,"
	{
		"gea",
		"<cmd>lua require('textcase').operator('to_phrase_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Phrase Case",
	},
	{
		"gec",
		"<cmd>lua require('textcase').operator('to_camel_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Camel Case",
	},
	{
		"gep",
		"<cmd>lua require('textcase').operator('to_pascal_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Pascal Case",
	},
	{
		"get",
		"<cmd>lua require('textcase').operator('to_title_case')<CR>",
		mode = { "n", "x" },
		desc = "[textcase] Operator Pending to Title Case",
	},
	{
		"gef",
		"<cmd>lua require('textcase').operator('to_path_case')<CR>",
		mode = { "n", "x" },
    desc = "[textcase] Operator Pending to Path Case",
	},
}

return M
