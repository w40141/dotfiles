local M = {}

function M.quickhl()
	local key = vim.keymap.set
	key({ "n", "x" }, ",m", "<plug>(quickhl-manual-this)", { desc = "mark underline word" })
	key({ "n", "x" }, ",M", "<plug>(quickhl-manual-reset)", { desc = "reset underline word" })
end

function M.hlslens()
	local key = vim.keymap.set
	key(
		"n",
		"n",
		[[<CMD>execute('normal!'.v:count1.'n')<CR><CMD>lua require('hlslens').start()<CR>]],
		{ desc = "Go to next match" }
	)
	key(
		"n",
		"N",
		[[<CMD>execute('normal!'.v:count1.'N')<CR><CMD>lua require('hlslens').start()<CR>]],
		{ desc = "Go to previous match" }
	)
	key("n", "*", function()
		require("lasterisk").search()
		require("hlslens").start()
	end, { desc = "Search current word" })

	key({ "n", "x" }, "g*", function()
		require("lasterisk").search({ is_whole = false })
		require("hlslens").start()
	end, { desc = "Search current word (no whole word)" })
	key("n", "<c-c>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })
end

return M
