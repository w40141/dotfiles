local M = {}

function M.quickhl()
	local key = vim.keymap.set
	key("n", ",m", "<plug>(quickhl-manual-this)")
	key("x", ",m", "<plug>(quickhl-manual-this)")
	key("n", ",M", "<plug>(quickhl-manual-reset)")
	key("x", ",M", "<plug>(quickhl-manual-reset)")
end

function M.hlslens()
	local key = vim.keymap.set
	key("n", "n", [[<CMD>execute('normal!'.v:count1.'n')<CR><CMD>lua require('hlslens').start()<CR>]])
	key("n", "N", [[<CMD>execute('normal!'.v:count1.'N')<CR><CMD>lua require('hlslens').start()<CR>]])
	key("n", "*", function()
		require("lasterisk").search()
		require("hlslens").start()
	end)

	key({ "n", "x" }, "g*", function()
		require("lasterisk").search({ is_whole = false })
		require("hlslens").start()
	end)
	key("n", "<c-c>", "<CMD>nohlsearch<CR>")
end

return M
