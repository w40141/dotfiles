local M = {}

function M.winresizer()
	local g = vim.g
	g.winresizer_keycode_cancel = 122
	-- To expand your window size toward upper using upper arrow (instead of k)
	g.winresizer_keycode_up = "<UP>"
	-- To expand your window size toward lower using down arrow (instead of j)
	g.winresizer_keycode_down = "<DOWN>"
end

function M.neogen()
	local key = vim.keymap.set
	local function f(name)
		return function()
			return require("neogen")[name]()
		end
	end

	-- TODO: description
	key("i", "<C-l>", f("jump_next"))
	key("i", "<C-h>", f("jump_prev"))
	key("n", ",n", f("generate"))
end

return M
