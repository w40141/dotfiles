local M = {}

function M.todo_comments()
	local key = vim.keymap.set
	key("n", "[ff]c", "<Cmd>TodoTelescope<CR>")
end

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

return M
