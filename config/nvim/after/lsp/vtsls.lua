---@type vim.lsp.Config
return {
	-- vtslsは型/補完/定義ジャンプ担当。formatはBiomeに任せる
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	single_file_support = false,

	settings = {
		typescript = {
			preferences = {
				importModuleSpecifier = "non-relative",
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = false },
			},
		},
	},
}
