local M = {}

function M.yanky()
	local key = vim.keymap.set
	key({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Yanky: Put After" })
	key({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Yanky: Put Before" })
	key({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "Yanky: GPut After" })
	key({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "Yanky: GPut Before" })
	key("n", "<c-n>", "<Plug>(YankyCycleForward)", { desc = "Yanky: Cycle Forward" })
	key("n", "<c-p>", "<Plug>(YankyCycleBackward)", { desc = "Yanky: Cycle Backward" })
	key("n", "<c-y>", "<Cmd>YankyRingHistory<CR>", { desc = "Yanky: Ring History" })
end

function M.ufo()
	local function f(name)
		return function()
			return require("ufo")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "zR", f("openAllFolds"), { desc = "ufo: Open All Folds" })
	key("n", "zM", f("closeAllFolds"), { desc = "ufo: Close All Folds" })
	key("n", "zr", f("openFoldsExceptKinds"), { desc = "ufo: Open Folds Except Kinds" })
	key("n", "zm", f("closeFoldsWith"), { desc = "ufo: Close Folds With" })
end

return M
