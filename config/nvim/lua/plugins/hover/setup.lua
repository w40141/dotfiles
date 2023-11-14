local M = {}

function M.hover()
	local v = vim
	local key = v.keymap.set

	local function builtin(name)
		return function()
			return require("hover")[name]()
		end
	end

	key("n", "H", builtin("hover"), { desc = "hover.nvim" })
	key("n", "gH", builtin("hover_select"), { desc = "hover.nvim (select)" })
end

return M
