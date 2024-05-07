local M = {}

function M.hover()
	local v = vim
	local api = v.api
	local key = v.keymap.set

	key("n", "K", function()
		local hover_win = v.b.hover_preview
		if hover_win and api.nvim_win_is_valid(hover_win) then
			api.nvim_set_current_win(hover_win)
		else
			require("hover").hover()
		end
	end, { desc = "hover.nvim" })

	key("n", "gK", function()
		require("hover").hover_select()
	end, { desc = "hover.nvim (select)" })
end

return M
