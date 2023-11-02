local M = {}

function M.skkeleton()
	local key = vim.keymap.set
	key("i", "<F9>", "<Plug>(skkeleton-disable)")
	key("i", "<F10>", "<Plug>(skkeleton-enable)")
	key("i", "<C-x><C-o>", function()
		require("cmp").complete()
	end)
end

return M
