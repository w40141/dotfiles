local M = {}

function M.vim_test()
	-- local key = vim.keymap.set
	-- key("n", "t<c-n>", "<cmd>TestNeares<cr>")
	-- key("n", "t<c-f>", "<cmd>TestFile<cr>")
	-- key("n", "t<c-s>", "<cmd>TestSuite<cr>")
	-- key("n", "t<c-l>", "<cmd>TestLast<cr>")
	-- key("n", "t<c-g>", "<cmd>TestVisit<cr>")
end

function M.open_browser()
	local key = vim.keymap.set
	key({ "n", "v" }, "gx", "<plug>(openbrowser-smart-search)")
end

return M
