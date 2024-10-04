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
	local fn = v.fn
	local lsp = v.lsp
	local api = v.api
	local hl = api.nvim_set_hl
	local buf = lsp.buf
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd
	local lspconfig = require("lspconfig")

	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local sign = "DiagnosticSign" .. type
		fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
	end

	-- https://dev.classmethod.jp/articles/eetann-change-neovim-lsp-diagnostics-format/
	lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			format = function(diagnostic)
				if not diagnostic.source then
					return diagnostic.message
				end
				return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
			end,
		},
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	local on_attach = function(client, bufnr)
		api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", {})

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
	end

	local lsp_flags = { debounce_text_changes = 150 }

	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	local handler = function(server_name)
		local node_root_dir = lspconfig.util.root_pattern("package.json")
		local is_node_repo = node_root_dir(api.nvim_buf_get_name(0)) ~= nil

		local opts = {}
		-- bash-language-server bashls

		-- biome

		-- deno denols
		if server_name == "denols" then
			if is_node_repo then
				return
			end
			opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
			opts.init_options = {
				lint = true,
				unstable = true,
				suggest = {
					imports = {
						hosts = {
							["https://deno.land"] = true,
							["https://cdn.nest.land"] = true,
							["https://crux.land"] = true,
						},
					},
				},
			}
		end

		-- docker-compose-language-service docker_compose_language_service
		-- dockerfile-language-server dockerls

		-- efm
		if server_name == "efm" then
			local languages = {
				markdown = {
					-- 配列を渡す必要がある
					{
						prefix = "textlint",
						lintIgnoreExitCode = true,
						lintSource = "efm/textlint",
						lintStdin = true,
						lintCommand = "textlint --no-color --format compact --stdin --stdin-filename ${INPUT}",
						lintFormats = {
							"%.%#: line %l, col %c, %trror - %m",
							"%.%#: line %l, col %c, %tarning - %m",
						},
						rootMarkers = {
							".textlintrc",
							".textlintrc.json",
							".textlintrc.yml",
							".textlintrc.yaml",
						},
					},
				},
			}

			opts.init_options = {
				documentFormatting = true,
				hover = true,
				codeAction = true,
			}
			opts.filetypes = v.tbl_keys(languages)
			opts.settings = {
				rootMarkers = { ".git/" },
				languages = languages,
			}
		end

		-- eslint-lsp eslint
		if server_name == "eslint" then
			local biome_root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc")
			local is_biome_repo = biome_root_dir(api.nvim_buf_get_name(0)) ~= nil
			if not is_node_repo or is_biome_repo then
				return
			end
			opts.root_dir = node_root_dir
		end

		if server_name == "contextive" then
		end

		if server_name == "fsautocomplete" then
			-- opt
		end

		-- gopls
		if server_name == "gopls" then
			opts.settings = {
				gopls = {
					analyses = {
						appends = true,
						asmdetect = true,
						assign = true,
						atomic = true,
						atomicalign = true,
						bools = true,
						buildtags = true,
						cgocall = true,
						composite = true,
						copylocks = true,
						deepequalerrors = true,
						defers = true,
						deprecated = true,
						directive = true,
						embed = true,
						errorsas = true,
						fieldalignment = false,
						fillreturns = true,
						httpresponse = true,
						ifaceassert = true,
						infertypeargs = true,
						loopclosure = true,
						lostcancel = true,
						nilfunc = true,
						nilness = true,
						nonewvars = true,
						noresultvalues = true,
						printf = true,
						shadow = true,
						shift = true,
						simplifyrange = true,
						simplifyslice = true,
						slog = true,
						sortslice = true,
						stdmethods = true,
						stdversion = true,
						stringintconv = true,
						structtag = true,
						stubmethods = true,
						testinggoroutine = true,
						tests = true,
						timeformat = true,
						undeclaredname = true,
						unmarshal = true,
						unreachable = true,
						unsafeptr = true,
						unusedparams = true,
						unusedresult = true,
						unusedstructfield = true,
						unusedvariable = true,
						unusedwrite = true,
						useany = true,
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
			}
		end

		-- graphql-language-service-cli graphql
		if server_name == "graphql" then
			opts.cmd = { "graphql-lsp", "server", "-m", "stream" }
			opts.filetypes = { "graphql", "gql", "graphqls" }
			opts.root_dir = lspconfig.util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*")
		end

		-- html-lsp html

		-- jtdls
		-- if server_name == "jtdls" then
		-- end

		-- lua-language-server lua_ls
		if server_name == "lua_ls" then
			opts.settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = v.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
					-- format = {
					-- 	enable = true,
					-- 	defaultConfig = {
					-- 		indent_type = "tab",
					-- 		indent_width = "4",
					-- 	},
					-- },
				},
			}
		end

		-- remark-language-server
		-- if server_name == "remark_ls" then
		--   opts.settings = {
		--     requireConfig = true
		--   }
		-- end

		-- prisma-language-server prismals

		-- pylsp

		-- pyright

		-- rust-analyzer rust_analyzer
		if server_name == "rust_analyzer" then
			opts.settings = {
				["rust-analyzer"] = { diagnostics = { enable = false } },
			}
		end

		-- sqlls

		-- taplo

		-- terraform

		if server_name == "terraform" then
			opts.filetypes = { "hcl", "tf", "tfvars" }
			opts.root_dir = lspconfig.util.root_pattern(".git", ".terraform", ".gitmodules")
		end

		-- texlab

		-- typescript-language-server tsserver
		-- if server_name == "tsserver" then
		-- 	if not is_node_repo then
		-- 		return
		-- 	end
		-- 	opts.root_dir = node_root_dir
		-- end

		if server_name == "typos_lsp" then
			opts.init_options = {
				config = "~/.config/nvim/spell/.typos.toml",
				diagnosticSeverity = "Hint",
			}
		end

		-- yamlls
		if server_name == "yamlls" then
			opts.settings = {
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
			}
		end

		opts.capabilities = capabilities
		opts.on_attach = on_attach
		opts.flag = lsp_flags

		lspconfig[server_name].setup(opts)
	end

	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls",
			"biome",
			"cssls",
			"denols",
			"docker_compose_language_service",
			"dockerls",
			"efm",
			"eslint",
			"fsautocomplete",
			"gopls",
			"graphql",
			"html",
			"jdtls",
			"lua_ls",
			"prismals",
			"pylsp",
			"rust_analyzer",
			"sqlls",
			"taplo",
			"terraformls",
			"texlab",
			"ts_ls",
			"typos_lsp",
			"yamlls",
		},
	})
	require("mason-lspconfig").setup_handlers({ handler })
end

return M
