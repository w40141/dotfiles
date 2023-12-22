local M = {}

function M.lspconfig()
	local v = vim
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
		v.fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
	end

	-- https://dev.classmethod.jp/articles/eetann-change-neovim-lsp-diagnostics-format/
	lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = false,
		virtual_text = {
			format = function(diagnostic)
				return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
			end,
		},
	})

	-- local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities())
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local on_attach = function(client, bufnr)
		api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

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

	local handler = function(server_name)
		local node_root_dir = lspconfig.util.root_pattern("package.json")
		local is_node_repo = node_root_dir(api.nvim_buf_get_name(0)) ~= nil

		local opts = {}
		-- bash-language-server bashls

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
			opts.init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
				-- hover = true,
				-- documentSymbol = true,
				codeAction = true,
				-- completion = true,
			}
			opts.single_file_support = true
			opts.filetypes = { "markdown" }
			opts.settings = {
				rootMarkers = { ".git/" },
				languages = {
					markdown = {
						{
							-- lintIgnoreExitCode = true,
							-- lintCommand = [[npx textlint -f json ${INPUT} | jq -r '.[] | .filePath as $filePath | .messages[] | "1;\($filePath):\(.line):\(.column):\n2;\(.message | split("\n")[0])\n3;[\(.ruleId)]"']],
							-- lintFormats = {
							-- 	"%f:%l:%c: %m [%trror/%r]",
							-- },
							-- https://textlint.github.io/
							prefix = "textlint",
							lintSource = "efm/textlint",
							lintCommand = "textlint --no-color --format compact --stdin --stdin-filename ${INPUT}",
							lintStdin = true,
							lintFormats = {
								"%.%#: line %l, col %c, %trror - %m",
								"%.%#: line %l, col %c, %tarning - %m",
							},
							rootMarkers = {
								".textlintrc",
								".textlintrc.js",
								".textlintrc.json",
								".textlintrc.yml",
								".textlintrc.yaml",
							},
						},
					},
				},
			}
		end

		-- eslint-lsp eslint
		if server_name == "eslint" then
			if not is_node_repo then
				return
			end
			opts.root_dir = node_root_dir
		end

		-- gopls
		if server_name == "gopls" then
			autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					local params = v.lsp.util.make_range_params()
					params.context = { only = { "source.organizeImports" } }
					local result = v.lsp.buf_request_sync(0, "textDocument/codeAction", params)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								local enc = (v.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
								v.lsp.util.apply_workspace_edit(r.edit, enc)
							end
						end
					end
					v.lsp.buf.format({ async = false })
				end,
			})
			opts.settings = {
				gopls = {
					analyses = {
						fieldalignment = true,
						nilness = true,
						shadow = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
						unusedstructfield = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			}
		end

		-- if server_name == "golangci_lint_ls" then
		-- 	-- opts.filetypes = { "go", "gomod" }
		-- 	-- opts.cmd = { "golangci-lint-langserver" }
		-- 	-- opts.root_dir = nvim_lsp.util.root_pattern(".git", "go.mod")
		-- 	opts.init_options = {
		-- 		command = { "golangci-lint", "run", "--out-format", "json" },
		-- 	}
		-- end

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

		-- pyright

		-- ruff-lsp ruff_lsp
		if server_name == "ruff_lsp" then
			opts.init_options = {
				settings = {
					-- Any extra CLI arguments for `ruff` go here.
					args = {},
				},
			}
		end

		-- rust-analyzer rust_analyzer
		if server_name == "rust_analyzer" then
			opts.settings = {
				["rust-analyzer"] = { diagnostics = { enable = false } },
			}
		end

		-- sqlls

		-- texlab

		-- typescript-language-server tsserver
		if server_name == "tsserver" then
			if not is_node_repo then
				return
			end
			opts.root_dir = node_root_dir
		end

		-- yamlls

		opts.capabilities = capabilities
		opts.on_attach = on_attach
		opts.flag = lsp_flags

		lspconfig[server_name].setup(opts)
	end

	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls",
			"denols",
			"docker_compose_language_service",
			"dockerls",
			"efm",
			"eslint",
			"gopls",
			"graphql",
			"html",
			"jdtls",
			"lua_ls",
			"prismals",
			"pyright",
			"ruff_lsp",
			"rust_analyzer",
			"sqlls",
			"texlab",
			"tsserver",
			"yamlls",
		},
	})
	require("mason-lspconfig").setup_handlers({ handler })
end

return M
