local M = {}

function M.aerial()
	vim.keymap.set("n", "gt", "<Cmd>AerialToggle<CR>")
end

return M
