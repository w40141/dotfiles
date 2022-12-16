return {
	function()
		local v = vim
		local key = v.keymap.set

		key("n", "[b", "<Cmd>BufferLineCyclePrev<cr>")
		key("n", "]b", "<Cmd>BufferLineCycleNext<cr>")

		key("n", "bE", "<Cmd>BufferLineSortByExtension<cr>")
		key("n", "bD", "<Cmd>BufferLineSortByDirectory<cr>")
		key("n", "bg", "<Cmd>BufferLinePick<cr>")

		key("n", "<silent><leader>1", "<Cmd>BufferLineGoToBuffer 1<cr>")
		key("n", "<silent><leader>2", "<Cmd>BufferLineGoToBuffer 2<cr>")
		key("n", "<silent><leader>3", "<Cmd>BufferLineGoToBuffer 3<cr>")
		key("n", "<silent><leader>4", "<Cmd>BufferLineGoToBuffer 4<cr>")
		key("n", "<silent><leader>5", "<Cmd>BufferLineGoToBuffer 5<cr>")
		key("n", "<silent><leader>6", "<Cmd>BufferLineGoToBuffer 6<cr>")
		key("n", "<silent><leader>7", "<Cmd>BufferLineGoToBuffer 7<cr>")
		key("n", "<silent><leader>8", "<Cmd>BufferLineGoToBuffer 8<cr>")
		key("n", "<silent><leader>9", "<Cmd>BufferLineGoToBuffer 9<cr>")
	end
}
