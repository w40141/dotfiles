local M = {}

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

function M.close()

	local function f(name)
		return function()
			return require("close_buffers").delete({ type = name })
		end
	end

	local key = vim.keymap.set
	key("n", "<leader>bh", f("hidden"), { noremap = true, silent = true, desc = "Close Hidden Buffers" })
	key("n", "<leader>bt", f("this"), { noremap = true, silent = true, desc = "Close This Buffer" })
	key("n", "<leader>ba", f("all"), { noremap = true, silent = true, desc = "Close All Buffers" })
	key("n", "<leader>bo", f("other"), { noremap = true, silent = true, desc = "Close Other Buffers" })
end

return M
