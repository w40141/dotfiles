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
		"[BUF]h",
		f("hidden"),
		{ noremap = true, silent = true, desc = "[close-buffers] 隠れているバッファをすべて削除" }
	)
	key(
		"n",
		"[BUF]t",
		f("this"),
		{ noremap = true, silent = true, desc = "[close-buffers] 現在のバッファを削除" }
	)
	key(
		"n",
		"[BUF]a",
		f("all"),
		{ noremap = true, silent = true, desc = "[close-buffers] すべてのバッファを削除" }
	)
	key(
		"n",
		"[BUF]o",
		f("other"),
		{ noremap = true, silent = true, desc = "[close-buffers] 現在のバッファ以外を削除" }
	)
end

return M
