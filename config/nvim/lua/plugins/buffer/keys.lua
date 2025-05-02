local M = {}

local function f(name)
	return function()
		return require("close_buffers").delete({ type = name })
	end
end

M.close = {
	{
		"[BUF]h",
		f("hidden"),
		{ noremap = true, silent = true, desc = "[close-buffers] 隠れているバッファをすべて削除" },
	},
	{
		"[BUF]t",
		f("this"),
		{ noremap = true, silent = true, desc = "[close-buffers] 現在のバッファを削除" },
	},
	{
		"[BUF]a",
		f("all"),
		{ noremap = true, silent = true, desc = "[close-buffers] すべてのバッファを削除" },
	},
	{
		"[BUF]o",
		f("other"),
		{ noremap = true, silent = true, desc = "[close-buffers] 現在のバッファ以外を削除" },
	},
}

return M
