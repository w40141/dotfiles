local M = {}

function M.mason()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			width = 0.7,
			height = 0.7,
		},
	})
end

function M.lspconfig()
	local v = vim
	local lsp = v.lsp
	local api = v.api
	local hl = api.nvim_set_hl
	local buf = lsp.buf
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd

	local diag = v.diagnostic
	diag.config({
		virtual_text = {
			format = function(d)
				return string.format("%s (%s: %s)", d.message, d.source, d.code)
			end,
		},
		signs = {
			text = {
				[diag.severity.ERROR] = "",
				[diag.severity.WARN] = "",
				[diag.severity.INFO] = "",
				[diag.severity.HINT] = "",
			},
		},
	})

	local capabilities = lsp.protocol.make_client_capabilities()
	capabilities.textDocument.semanticTokens.multilineTokenSupport = true
	--Enable (broadcasting) snippet capability for completion
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	lsp.config("*", {
		capabilities = capabilities,
		root_markers = { ".git" },
		on_attach = function(client, bufnr)
			if client.server_capabilities.documentHighlightProvider then
				hl(0, "LspReferenceText", { underline = true, bold = true, fg = "#A00000", bg = "#104040" })
				hl(0, "LspReferenceRead", { underline = true, bold = true, fg = "#A00000", bg = "#104040" })
				hl(0, "LspReferenceWrite", { underline = true, bold = true, fg = "#A00000", bg = "#104040" })
				local ldh = augroup("LspDocumentHighlight", {})
				autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = bufnr,
					callback = buf.document_highlight,
					group = ldh,
				})
				autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = bufnr,
					callback = buf.clear_references,
					group = ldh,
				})
			end
		end,
	})

	lsp.config("bashls", {})

	lsp.config("cspell_lsp", {})

	lsp.config("docker_compose_language_service", {})

	lsp.config("docker_language_server", {})

	local efm_enabled_language = {
		markdown = {
			-- 配列を渡す必要がある
			{
				prefix = "textlint",
				lintIgnoreExitCode = true,
				-- lintSource = "efm/textlint",
				lintStdin = true,
				lintCommand = "textlint --no-color --format unix --stdin --stdin-filename ${INPUT}",
				-- 例: README.md:1:2: error  message  rule-name
				lintFormats = {
					"%f:%l:%c: %t%*[^ ]%*[^ ] %m",
				},
				-- lintCommand = "textlint --no-color --format compact --stdin --stdin-filename ${INPUT}",
				-- lintFormats = {
				-- 	"%.%#: line %l, col %c, %trror - %m",
				-- 	"%.%#: line %l, col %c, %tarning - %m",
				-- },
				rootMarkers = {
					".textlintrc",
					".textlintrc.json",
					".textlintrc.yml",
					".textlintrc.yaml",
				},
			},
		},
	}
	-- lsp.config("efm", {
	-- 	cmd = { "efm-langserver" },
	-- 	init_options = {
	-- 		documentFormatting = true,
	-- 		hover = true,
	-- 		codeAction = true,
	-- 	},
	-- 	filetypes = vim.tbl_keys(efm_enabled_language),
	-- 	settings = {
	-- 		-- ここに textlint の rootMarker も入れると「どこで動くか」迷子になりにくい
	-- 		rootMarkers = {
	-- 			".git/",
	-- 			".textlintrc",
	-- 			".textlintrc.json",
	-- 			".textlintrc.yml",
	-- 			".textlintrc.yaml",
	-- 			"package.json",
	-- 		},
	-- 		languages = efm_enabled_language,
	-- 	},
	-- })

	lsp.config("fish-lsp", {})

	lsp.config("gopls", {
		settings = {
			gopls = {
				-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
				analyses = {
					shadow = true,
				},
				hints = {
					assignVariableTypes = true,
					compositeLiteralFieldsk = true,
					compositeLiteralTypes = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	})

	lsp.config("html", {})

	lsp.config("lua_ls", {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= v.fn.stdpath("config")
					and (v.uv.fs_stat(path .. "/.luarc.json") or v.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end
			client.config.settings.Lua = v.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = v.list_extend(v.api.nvim_get_runtime_file("lua", true), {
						"${3rd}/luv/library",
						"${3rd}/busted/library",
					}),
				},
			})
		end,
		settings = {
			Lua = {
				diagnostics = {
					unusedLocalExclude = { "_*" },
					globals = { "vim" },
				},
			},
		},
	})

	lsp.config("marksman", {
		cmd = { "marksman", "server" },
		filetypes = { "markdown" },
		root_markers = { ".git", ".marksman.toml" },
	})

	-- lsp.config("rumdl", {
	-- 	cmd = { "rumdl", "server" },
	-- 	filetypes = { "markdown" },
	-- 	root_markers = { ".git" },
	-- })

	-- lsp.config("sqlls", {})
	lsp.config("sqls", {})

	lsp.config("taplo", {})

	-- lsp.config("typos_lsp", {
	-- 	init_options = {
	-- 		config = "~/.config/nvim/spell/.typos.toml",
	-- 		diagnosticSeverity = "Hint",
	-- 	},
	-- })

	lsp.config("yamlls", {
		settings = {
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
	})

	local ensure_installed = {
		"bashls",
		"biome",
		-- "cspell_ls",
		"docker_compose_language_service",
		"docker_language_server",
		"efm",
		"fish_lsp",
		"gopls",
		"html",
		"lua_ls",
		"marksman",
		-- "rumdl",
		"sqls",
		"taplo",
		-- "typos_lsp",
		"yamlls",
	}

	require("mason-lspconfig").setup({
		automatic_enable = true,
		ensure_installed = ensure_installed,
	})
end

return M
