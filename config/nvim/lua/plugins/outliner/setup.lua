local M = {}

function M.aerial()
	vim.keymap.set("n", "gt", "<Cmd>AerialToggle<CR>", { desc = "Toggle outliner by aerial" })
end

return M
