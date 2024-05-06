local M = {}

function M.eskk()
	local key = vim.keymap.set
	key("i", "jk", "<Plug>(eskk:toggle)")
	key("c", "jk", "<Plug>(eskk:toggle)")
end

function M.yanky()
	local key = vim.keymap.set
	key({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	key({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	key({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
	key({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
	key("n", "<c-n>", "<Plug>(YankyCycleForward)")
	key("n", "<c-p>", "<Plug>(YankyCycleBackward)")
	key("n", "<c-y>", "<Cmd>YankyRingHistory<CR>")
end

function M.ufo()
	local key = vim.keymap.set
	local function f(name)
		return function()
			return require("ufo")[name]()
		end
	end
	key("n", "zR", f("openAllFolds"))
	key("n", "zM", f("closeAllFolds"))
	key("n", "zr", f("openFoldsExceptKinds"))
	key("n", "zm", f("closeFoldsWith"))
end

return M
