local M = {}

function M.tree()
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>")
end

return M
