local M = {}

function M.hover()
	local api = vim.api
	local key = vim.keymap.set

	key("n", "K", function()
		local hover_window = vim.b.hover_preview
		if hover_window and api.nvim_win_is_valid(hover_window) then
			api.nvim_set_current_win(hover_window)
		else
			require("hover").hover()
		end
	end, { desc = "[hover] ホバーを表示" })

	key("n", "gK", function()
		require("hover").hover_select()
	end, { desc = "[hover] ホバーを選択" })
end

return M
