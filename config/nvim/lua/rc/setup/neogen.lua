return {
	function()
		local function f(name)
			return function()
				return require("neogen")[name]()
			end
		end

		local key = vim.keymap.set
		key("i", "<C-l>", f "jump_next")
		key("i", "<C-h>", f "jump_prev")
		key("n", ",n", f "generate")
	end
}
