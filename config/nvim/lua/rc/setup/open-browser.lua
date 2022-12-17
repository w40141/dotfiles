return {
	function()
		local key = vim.keymap.set
		key("n", "gx", "<plug>(openbrowser-smart-search)")
		key("v", "gx", "<plug>(openbrowser-smart-search)")
	end
}
