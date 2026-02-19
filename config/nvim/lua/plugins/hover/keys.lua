local M = {}

local v = vim

M.hover = {
	{
		"K",
		function()
			if v.b.hover_preview then
				require("hover").switch("next")
			else
				require("hover").open()
			end
		end,
		desc = "[hover] ホバーを開く / 次へ切り替える",
	},
	{
		"gK",
		function()
			require("hover").enter()
		end,
		desc = "[hover] ホバーを開いてフォーカスする",
	},
	{
		"[h",
		function()
			require("hover").switch("previous")
		end,
		desc = "[hover] 前のソースに切り替える",
	},
	{
		"]h",
		function()
			require("hover").switch("next")
		end,
		desc = "[hover] 次のソースに切り替える",
	},
	{
		"<MouseMove>",
		function()
			require("hover").mouse()
		end,
		desc = "[hover] マウスでホバーを操作する",
	},
}

return M
