local M = {}
local v = vim
local key = v.keymap.set

function M.todo_comments()
	key("n", "[ff]c", "<Cmd>TodoTelescope<CR>")
end

function M.neogen()
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
	key("i", "jk", "<Plug>(eskk:toggle)")
	key("c", "jk", "<Plug>(eskk:toggle)")
end

return M
