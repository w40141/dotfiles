local M = {}

function M.toggleterm()
	vim.keymap.set("n", "<Space>l", "<CMD>ToggleTerm<CR>")
end

return M
