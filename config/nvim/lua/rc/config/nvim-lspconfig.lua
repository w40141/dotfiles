return {
	function()
		local v = vim
		local fn = v.fn
		local lsp = v.lsp

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
	end
}
