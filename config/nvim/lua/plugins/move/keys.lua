local M = {}

local function spider(direction)
	return function()
		return require("spider").motion(direction)
	end
end

M.spider = {
	{
		"w",
		spider("w"),
		{ desc = "[spider] 次の単語に移動 (w)" },
	},
	{
		"e",
		spider("e"),
		{ desc = "[spider] 次の単語の末尾に移動 (e)" },
	},
	{
		"b",
		spider("b"),
		{ desc = "[spider] 前の単語に移動 (b)" },
	},
}

local function flash(action)
	return function()
		return require("flash")[action]()
	end
end

M.flash = {
	{
		"<C-s>",
		flash("jump"),
		{
			mode = { "n", "o", "x" },
			desc = "[flash] 文字ジャンプ (Flash)",
		},
	},
	{
		"S",
		flash("treesitter"),
		{
			mode = { "n", "o", "x" },
			desc = "[flash] Treesitter でジャンプ",
		},
	},
	{
		"r",
		flash("remote"),
		{
			mode = { "o" },
			desc = "[flash] リモートジャンプ (Remote Flash)",
		},
	},
	{
		"R",
		flash("treesitter_search"),
		{
			mode = { "x", "o" },
			desc = "[flash] Treesitter 検索",
		},
	},
}

return M
