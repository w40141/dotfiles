local M = {}

function M.eskk()
	local key = vim.keymap.set
	key({ "i", "c" }, "jk", "<Plug>(eskk:toggle)", { desc = "Toggle ESKK" })
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
	local function f(name)
		return function()
			return require("ufo")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "zR", f("openAllFolds"), { desc = "Open All Folds" })
	key("n", "zM", f("closeAllFolds"), { desc = "Close All Folds" })
	key("n", "zr", f("openFoldsExceptKinds"), { desc = "Open Folds Except Kinds" })
	key("n", "zm", f("closeFoldsWith"), { desc = "Close Folds With" })
end

return M
