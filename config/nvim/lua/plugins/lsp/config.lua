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
	local api = v.api
	local lsp = v.lsp
	local util = require("lspconfig.util")

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
		-- Document highlight（色直指定はやめる：colorschemeと衝突する）
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
			-- 見た目は控えめに：underlineだけで十分強い
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

	-- ========= helper =========
	local function safe_setup(server, cfg)
		cfg = cfg or {}
		cfg.capabilities = cfg.capabilities or capabilities
		cfg.on_attach = cfg.on_attach or on_attach
    lsp.config(server, cfg)
	end

	-- ========= biome command resolver (local node_modules priority) =========
	local function biome_cmd(root_dir)
		local local_biome = root_dir and (root_dir .. "/node_modules/.bin/biome") or nil
		if local_biome and v.uv.fs_stat(local_biome) then
			return { local_biome, "lsp-proxy" }
		end
		return { "biome", "lsp-proxy" }
	end

	-- ========= Servers =========
	safe_setup("bashls", {})

	safe_setup("cspell_lsp", {})

	safe_setup("docker_compose_language_service", {})
	safe_setup("dockerls", {}) -- docker_language_server の lspconfig 名は dockerls が一般的

	safe_setup("fish_lsp", {}) -- fish-lsp は fish_lsp が一般的

	safe_setup("gopls", {
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
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

	safe_setup("html", {})

	safe_setup("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					unusedLocalExclude = { "_*" },
					globals = { "vim" },
				},
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = v.list_extend(v.api.nvim_get_runtime_file("lua", true), {
						"${3rd}/luv/library",
						"${3rd}/busted/library",
					}),
				},
			},
		},
		-- .luarc があるプロジェクトは尊重（あなたの意図を保持）
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
		end,
	})

	safe_setup("marksman", {
		cmd = { "marksman", "server" },
		filetypes = { "markdown" },
		root_dir = util.root_pattern(".marksman.toml", ".git"),
	})

	safe_setup("sqls", {})
	safe_setup("taplo", {})

	safe_setup("yamlls", {
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
	})

	-- TypeScript (vtsls)
	safe_setup("vtsls", {
		root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
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

	-- Biome
	safe_setup("biome", {
		root_dir = util.root_pattern("biome.json", "biome.jsonc", ".git"),
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
		on_new_config = function(new_config, root_dir)
			new_config.cmd = biome_cmd(root_dir)
		end,
	})

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
		ensure_installed = ensure_installed,
	})
end

return M
