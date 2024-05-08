local M = {}

function M.close()

	local function f(name)
		return function()
			return require("close_buffers").delete({ type = name })
		end
	end

	local key = vim.keymap.set
	key("n", "<leader>bh", f("hidden"), { noremap = true, silent = true, desc = "Close Hidden Buffers" })
	key("n", "<leader>bt", f("this"), { noremap = true, silent = true, desc = "Close This Buffer" })
	key("n", "<leader>ba", f("all"), { noremap = true, silent = true, desc = "Close All Buffers" })
	key("n", "<leader>bo", f("other"), { noremap = true, silent = true, desc = "Close Other Buffers" })
end

return M
