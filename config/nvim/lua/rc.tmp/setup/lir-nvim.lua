return {
	function()
		vim.keymap.set("n", "<leader>e", function()
			require("lir.float").toggle()
		end)
	end
}
