local M = {}

function M.close()
	local function f(name)
		return function()
			return require("close_buffers").delete({ type = name })
		end
	end

	local key = vim.keymap.set
	key(
		"n",
		"<leader>bh",
		f("hidden"),
		{ noremap = true, silent = true, desc = "bufdelete: 隠れているバッファをすべて削除する" }
	)
	key(
		"n",
		"<leader>bt",
		f("this"),
		{ noremap = true, silent = true, desc = "bufdelete: このバッファを削除する" }
	)
	key(
		"n",
		"<leader>ba",
		f("all"),
		{ noremap = true, silent = true, desc = "bufdelete: すべてのバッファを削除する" }
	)
	key(
		"n",
		"<leader>bo",
		f("other"),
		{ noremap = true, silent = true, desc = "bufdelete: これ以外のバッファを削除する" }
	)
end

return M
