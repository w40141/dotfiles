local M = {}

function M.tree()
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree" })
end

return M
