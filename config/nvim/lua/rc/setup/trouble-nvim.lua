return {
	function()
		local key = vim.keymap.set
		key("n", "[tl]f", "<cmd>Trouble document_diagnostics<cr>")
		key("n", "[tl]w", "<cmd>Trouble workspace_diagnostics<cr>")
		key("n", "[tl]q", "<cmd>Trouble quickfix<cr>")
		key("n", "[tl]l", "<cmd>Trouble loclist<cr>")
		key("n", "[tl]/", "<cmd>Trouble lsp_references<cr>")
		key("n", "[tl]d", "<cmd>Trouble lsp_definitions<cr>")
		key("n", "[tl]t", "<cmd>Trouble lsp_type_definitions<cr>")
	end
}
