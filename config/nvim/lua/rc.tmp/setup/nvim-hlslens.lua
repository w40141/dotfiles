return {
	function()
		local v = vim
		local key = v.keymap.set

		key('n', 'n',
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]]
		)
		key('n', 'N',
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]]
		)
		key('n', '*', function()
			require("lasterisk").search()
			require('hlslens').start()
		end)

		key({ 'n', 'x' }, 'g*', function()
			require("lasterisk").search({ is_whole = false })
			require('hlslens').start()
		end)
		key("n", "<c-c>", "<Cmd>nohlsearch<CR>")
	end
}
