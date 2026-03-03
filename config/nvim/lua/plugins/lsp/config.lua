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
		-- Document highlight
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
	end

	lsp.config("*", {
		root_markers = { ".git" },
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lsp.config("bashls", {})

	lsp.config("cspell_lsp", {})

	lsp.config("docker_compose_language_service", {})

	lsp.config("docker_language_server", {})

	-- local efm_enabled_language = {
	-- 	markdown = {
	-- 		-- 配列を渡す必要がある
	-- 		{
	-- 			prefix = "textlint",
	-- 			lintIgnoreExitCode = true,
	-- 			-- lintSource = "efm/textlint",
	-- 			lintStdin = true,
	-- 			lintCommand = "textlint --no-color --format unix --stdin --stdin-filename ${INPUT}",
	-- 			-- 例: README.md:1:2: error  message  rule-name
	-- 			lintFormats = {
	-- 				"%f:%l:%c: %t%*[^ ]%*[^ ] %m",
	-- 			},
	-- 			-- lintCommand = "textlint --no-color --format compact --stdin --stdin-filename ${INPUT}",
	-- 			-- lintFormats = {
	-- 			-- 	"%.%#: line %l, col %c, %trror - %m",
	-- 			-- 	"%.%#: line %l, col %c, %tarning - %m",
	-- 			-- },
	-- 			rootMarkers = {
	-- 				".textlintrc",
	-- 				".textlintrc.json",
	-- 				".textlintrc.yml",
	-- 				".textlintrc.yaml",
	-- 			},
	-- 		},
	-- 	},
	-- }
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

	-- TypeScript LSP (vtsls)
	lsp.config("vtsls", {
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
	})

	-- biome実行パスを「プロジェクトのnode_modules/.bin優先」で解決する
	local function biome_cmd(root_dir)
		local local_biome = root_dir and (root_dir .. "/node_modules/.bin/biome") or nil
		if local_biome and v.uv.fs_stat(local_biome) then
			return { local_biome, "lsp-proxy" }
		end
		return { "biome", "lsp-proxy" }
	end

	lsp.config("biome", {
		-- ★pnpm/monorepoで最重要：Biome設定ファイルを最優先でrootにする
		root_markers = { "biome.json", "biome.jsonc", ".git" },

		-- rootごとに「そのrootのbiome」を使う
		on_new_config = function(new_config, root_dir)
			new_config.cmd = biome_cmd(root_dir)
		end,

		single_file_support = false,

		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"jsonc",
			"css",
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
		"vtsls",
	}

	require("mason-lspconfig").setup({
		automatic_enable = true,
		ensure_installed = ensure_installed,
	})
end

return M
