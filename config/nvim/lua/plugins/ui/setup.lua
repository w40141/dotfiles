local M = {}

function M.lualine()
	local v = vim
	v.opt.laststatus = 0
	v.opt.showtabline = 0
end

function M.bufferline()
	local key = vim.keymap.set

	key("n", "<leader>bd", "<Cmd>Bdelete<cr>", { desc = "Previous Buffer" })
	key("n", "<leader>bw", "<Cmd>Bwipeout<cr>", { desc = "Previous Buffer" })
	key("n", "[b", "<Cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
	key("n", "]b", "<Cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
	key("n", "bE", "<Cmd>BufferLineSortByExtension<cr>", { desc = "Sort by Extension" })
	key("n", "bD", "<Cmd>BufferLineSortByDirectory<cr>", { desc = "Sort by Directory" })
	key("n", "bg", "<Cmd>BufferLinePick<cr>", { desc = "Pick Buffer" })
end

function M.aerial()
	vim.keymap.set("n", "gt", "<Cmd>AerialToggle<CR>", { desc = "Toggle outliner by aerial" })
end

function M.tree()
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree" })
end

return M
