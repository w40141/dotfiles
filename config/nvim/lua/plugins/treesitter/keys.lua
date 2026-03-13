local M = {}

M.treesitter_textobjects = {
	-- select (function / class / scope)
	{
		"am",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "[treesitter] 関数全体を選択 (@function.outer)",
	},
	{
		"im",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "[treesitter] 関数内部のみを選択 (@function.inner)",
	},
	{
		"ac",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "[treesitter] クラス全体を選択 (@class.outer)",
	},
	{
		"ic",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "[treesitter] クラス内部のみを選択 (@class.inner)",
	},
	{
		"as",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
		end,
		mode = { "x", "o" },
		desc = "[treesitter] ローカルスコープを選択 (@local.scope)",
	},

	-- swap (parameter)
	{
		"<leader>a",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
		end,
		mode = "n",
		desc = "[treesitter] 次の引数と入れ替え (@parameter.inner)",
	},
	{
		"<leader>A",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
		end,
		mode = "n",
		desc = "[treesitter] 前の引数と入れ替え (@parameter.inner)",
	},

	-- move next start
	{
		"]m",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次の関数の開始位置へ移動",
	},
	{
		"]]",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次のクラスの開始位置へ移動",
	},
	{
		"]o",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次のループの開始位置へ移動",
	},
	{
		"]s",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次のローカルスコープへ移動",
	},
	{
		"]z",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次のfoldブロックへ移動",
	},

	-- move next end
	{
		"]M",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次の関数の終了位置へ移動",
	},
	{
		"][",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 次のクラスの終了位置へ移動",
	},

	-- move previous start
	{
		"[m",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 前の関数の開始位置へ移動",
	},
	{
		"[[",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 前のクラスの開始位置へ移動",
	},

	-- move previous end
	{
		"[M",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 前の関数の終了位置へ移動",
	},
	{
		"[]",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "[treesitter] 前のクラスの終了位置へ移動",
	},
}

return M
