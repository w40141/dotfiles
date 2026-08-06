local M = {}

function M.lspconfig()
	local v = vim
	local lsp = v.lsp
	local api = v.api

	-- ========= Diagnostic =========
	v.diagnostic.config({
		virtual_text = {
			format = function(d)
				if d.code then
					return string.format("[%s] %s", d.code, d.message)
				end
				return d.message
			end,
		},
		float = {
			border = "rounded",
			source = "if_many",
		},
		signs = {
			text = {
				[v.diagnostic.severity.ERROR] = "",
				[v.diagnostic.severity.WARN] = "",
				[v.diagnostic.severity.INFO] = "",
				[v.diagnostic.severity.HINT] = "",
			},
		},
	})

	-- ========= Capabilities =========
	local capabilities = lsp.protocol.make_client_capabilities()
	capabilities.textDocument.semanticTokens = capabilities.textDocument.semanticTokens or {}
	capabilities.textDocument.semanticTokens.multilineTokenSupport = true
	capabilities.textDocument.completion = capabilities.textDocument.completion or {}
	capabilities.textDocument.completion.completionItem = capabilities.textDocument.completion.completionItem or {}
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- cmp-nvim-lsp があるなら統合
	local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp then
		capabilities = cmp_lsp.default_capabilities(capabilities)
	end
	-- ========= on_attach =========
	local function on_attach(client, bufnr)
		if client.server_capabilities.documentHighlightProvider then
			local grp = api.nvim_create_augroup("LspDocumentHighlight:" .. bufnr, { clear = true })
			api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = grp,
				buffer = bufnr,
				callback = lsp.buf.document_highlight,
			})
			api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = grp,
				buffer = bufnr,
				callback = lsp.buf.clear_references,
			})
			api.nvim_set_hl(0, "LspReferenceText", { underline = true, bold = true })
			api.nvim_set_hl(0, "LspReferenceRead", { underline = true, bold = true })
			api.nvim_set_hl(0, "LspReferenceWrite", { underline = true, bold = true })
		end

		-- biome / vtsls のフォーマット責務分離
		if client.name == "vtsls" then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
		if client.name == "biome" then
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
		end
		-- Elixir の保存時自動フォーマット
		if client.name == "elixirls" then
			api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					lsp.buf.format({ async = false, id = client.id })
				end,
			})
		end
	end

	lsp.config("*", {
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

return M
