require("mason-lspconfig").setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
		require("lspconfig")[server].setup(opt)
	end,
})

require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer" },
})
