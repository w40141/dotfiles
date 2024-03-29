local M = {}

function M.hover()
	local v = vim
	local key = v.keymap.set

	local function b(name)
		return function()
			return require("hover")[name]()
		end
	end

	key("n", "H", b("hover"), { desc = "hover.nvim" })
	key("n", "gH", b("hover_select"), { desc = "hover.nvim (select)" })
end

return M
