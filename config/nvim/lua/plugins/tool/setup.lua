local M = {}

function M.memolist()
	local key = vim.keymap.set
end

function M.open_browser()
	local key = vim.keymap.set
	key({ "n", "v" }, "gx", "<plug>(openbrowser-smart-search)")
end

function M.toggleterm()
	vim.keymap.set("n", "<Space>l", "<cmd>ToggleTerm<CR>")
end

function M.winresizer()
	local g = vim.g
	g.winresizer_keycode_cancel = 122
	-- To expand your window size toward upper using upper arrow (instead of k)
	g.winresizer_keycode_up = "<UP>"
	-- To expand your window size toward lower using down arrow (instead of j)
	g.winresizer_keycode_down = "<DOWN>"
end

function M.quickhl()
	local key = vim.keymap.set
	key("n", ",m", "<plug>(quickhl-manual-this)")
	key("x", ",m", "<plug>(quickhl-manual-this)")
	key("n", ",M", "<plug>(quickhl-manual-reset)")
	key("x", ",M", "<plug>(quickhl-manual-reset)")
end

function M.hlslens()
	local key = vim.keymap.set
	key("n", "n", [[<Cmd>execute('normal!'.v:count1.'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
	key("n", "N", [[<Cmd>execute('normal!'.v:count1.'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
	key("n", "*", function()
		require("lasterisk").search()
		require("hlslens").start()
	end)

	key({ "n", "x" }, "g*", function()
		require("lasterisk").search({ is_whole = false })
		require("hlslens").start()
	end)
	key("n", "<c-c>", "<Cmd>nohlsearch<CR>")
end

return M
