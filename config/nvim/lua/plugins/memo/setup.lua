local M = {}

function M.memolist()
	local key = vim.keymap.set
	key({ "n", "v" }, "<leader>mn", "<cmd>MemoNew<cr>", { desc = "[memo] メモを新規作成" })
end

return M
