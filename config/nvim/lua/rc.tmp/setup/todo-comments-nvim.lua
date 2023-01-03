return {
	function()
		local key = vim.keymap.set
		key("n", "[ff]c", "<Cmd>TodoTelescope<CR>")
	end
}
