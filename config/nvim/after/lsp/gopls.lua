---@type vim.lsp.Config
return {
	settings = {
		gopls = {
			-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
			analyses = {
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
				nilness = true,
				useany = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
				constantValues = true,
				ignoredError = true,
			},
			staticcheck = true,
			gofumpt = true,
			codelenses = {
				tidy = true,
				upgrade_dependency = true,
				run_govulncheck = true,
				test = true,
				gc_details = false,
				vendor = false,
				generate = false,
				regenerate_cgo = false,
			},
		},
	},
}
