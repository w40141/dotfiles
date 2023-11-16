local M = {}

function M.neogen()
	local key = vim.keymap.set
	local function f(name)
		return function()
			return require("neogen")[name]()
		end
	end

	key("i", "<C-l>", f("jump_next"))
	key("i", "<C-h>", f("jump_prev"))
	key("n", ",n", f("generate"))
end

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
return M
