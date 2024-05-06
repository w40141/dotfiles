local M = {}

function M.bufferline()
	local key = vim.keymap.set

	key("n", "[b", "<Cmd>BufferLineCyclePrev<cr>")
	key("n", "]b", "<Cmd>BufferLineCycleNext<cr>")

	key("n", "bE", "<Cmd>BufferLineSortByExtension<cr>")
	key("n", "bD", "<Cmd>BufferLineSortByDirectory<cr>")
	key("n", "bg", "<Cmd>BufferLinePick<cr>")
end

function M.close()
	local key = vim.keymap.set

	key(
		"n",
		"<leader>bh",
		[[<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>]],
		{ noremap = true, silent = true }
	)
	key(
		"n",
		"<leader>bt",
		[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
		{ noremap = true, silent = true }
	)
	key(
		"n",
		"<leader>ba",
		[[<CMD>lua require('close_buffers').wipe({ type = 'all', force = true })<CR>]],
		{ noremap = true, silent = true }
	)
	key(
		"n",
		"<leader>bo",
		[[<CMD>lua require('close_buffers').wipe({ type = 'other' })<CR>]],
		{ noremap = true, silent = true }
	)
end

return M
