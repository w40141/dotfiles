local M = {}

function M.toggleterm()
	vim.keymap.set("n", "<Space>l", "<CMD>ToggleTerm<CR>", { desc = "Toggle terminal" })
end

return M
