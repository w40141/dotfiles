return {
	function()
		local v = vim
		local key = v.keymap.set
		key('i', 'jk', "<Plug>(eskk:toggle)")
		key('c', 'jk', "<Plug>(eskk:toggle)")
	end
}
