local M = {}

function M.memolist()
	local key = vim.keymap.set
	key({ "n", "v" }, "<leader>mn", "<CMD>MemoNew<CR>")
end

return M
