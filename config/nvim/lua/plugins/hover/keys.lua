local M = {}

local v = vim
local api = v.api

M.hover = {
	{
		"K",
		function()
			local hover_window = v.b.hover_preview
			if hover_window and api.nvim_win_is_valid(hover_window) then
				api.nvim_set_current_win(hover_window)
			else
				require("hover").hover()
			end
		end,
		{ desc = "[hover] ホバーを表示" },
	},
	{
		"gK",
		function()
			require("hover").hover_select()
		end,
		{ desc = "[hover] ホバーを選択" },
	},
}

return M
