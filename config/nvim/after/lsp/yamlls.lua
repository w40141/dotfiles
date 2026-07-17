---@type vim.lsp.Config
return {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			format = {
				enable = true,
				bracketSpacing = true,
				proseWrap = "Always",
			},
			hover = true,
			validate = true,
		},
	},
}
