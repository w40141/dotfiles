return {
	function()
		local v = vim
		local fn = v.fn
		local api = v.api
		local augroup = api.nvim_create_augroup -- Create/get autocommand group
		local autocmd = api.nvim_create_autocmd -- Create autocommand
		local hl = api.nvim_set_hl
		local lsp = v.lsp
		local buf = lsp.buf

		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			local sign = "DiagnosticSign" .. type
			fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
		end

		lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
			lsp.diagnostic.on_publish_diagnostics,
			{
				update_in_insert = false,
				virtual_text = {
					format = function(d)
						return string.format("%s (%s: %s)", d.message, d.source, d.code)
					end,
				},
			}
		)

		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentHighlightProvider then
				hl(0, "LspReferenceText", {
					underline = true,
					bold = true,
					fg = "#A00000",
					bg = "#104040",
				})
				hl(0, "LspReferenceRead", {
					underline = true,
					bold = true,
					fg = "#A00000",
					bg = "#104040",
				})
				hl(0, "LspReferenceWrite", {
					underline = true,
					bold = true,
					fg = "#A00000",
					bg = "#104040",
				})
				local ldh = augroup("LspDocumentHighlight", {})
				autocmd(
					{ "CursorHold", "CursorHoldI" },
					{ buffer = bufnr, callback = buf.document_highlight, group = ldh }
				)
				autocmd(
					{ "CursorMoved", "CursorMovedI" },
					{ buffer = bufnr, callback = buf.clear_references, group = ldh }
				)
			end
		end

		local lspconfig = require("lspconfig")
		local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		local capabilities
		if ok then
			capabilities = cmp_nvim_lsp.default_capabilities(lsp.protocol.make_client_capabilities())
		end

		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		})
	end
}
