local M = {}

local function neogen(action)
	return function()
		return require("neogen")[action]()
	end
end

M.neogen = {
	{
		"<C-l>",
		neogen("jump_next"),
		{
			mode = "i",
			desc = "[Neogen] 次のコメントセクションへジャンプする",
		},
	},
	{
		"<C-h>",
		neogen("jump_prev"),
		{
			mode = "i",
			desc = "[Neogen] 前のコメントセクションへジャンプする",
		},
	},
	{
		"<leader>n",
		neogen("generate"),
		{ desc = "[Neogen] 関数のドキュメントコメントを生成する" },
	},
}

local function winresize(win, amt, dir)
	return function()
		return require("winresize").resize(win, amt, dir)
	end
end

M.winresize = {
	{
		"<C-e>h",
		winresize(0, 2, "left"),
		{ desc = "[Winresize] 左にウィンドウをリサイズ" },
	},
	{
		"<C-e>l",
		winresize(0, 2, "right"),
		{ desc = "[Winresize] 右にウィンドウをリサイズ" },
	},
	{
		"<C-e>j",
		winresize(0, 1, "down"),
		{ desc = "[Winresize] 下にウィンドウをリサイズ" },
	},
	{
		"<C-e>k",
		winresize(0, 1, "up"),
		{ desc = "[Winresize] 上にウィンドウをリサイズ" },
	},
}

return M
