local M = {}

function M.mason_tool_installer()
	local v = vim
	require("mason-tool-installer").setup({
		ensure_installed = {
			"bash-language-server",
			"black",
			"cspell",
			"dockerfile-language-server",
			"eslint-lsp",
			"flake8",
			"graphql-language-service-cli",
			"html-lsp",
			"jdtls",
			"kotlin-language-server",
			"lua-language-server",
			"markdownlint",
			"marksman",
			"prettier",
			"pyright",
			"rust-analyzer",
			"rustfmt",
			"shfmt",
			"sql-formatter",
			"sqlfluff",
			"sqlls",
			"stylua",
			"typescript-language-server",
			"yaml-language-server",
		},
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
	})

	local m = v.api.nvim_create_augroup("Mason", {})
	v.api.nvim_create_autocmd("User", {
		pattern = "MasonToolsUpdateCompleted",
		callback = function()
			v.schedule(function()
				print("mason-tool-installer has finished")
			end)
		end,
		group = m,
	})
end

function M.lspconfig()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	local v = vim
	local fn = v.fn
	local api = v.api
	local key = v.keymap.set
	local hl = api.nvim_set_hl
	local lsp = v.lsp
	local buf = lsp.buf
	local augroup = v.api.nvim_create_augroup
	local autocmd = v.api.nvim_create_autocmd
	local signs = { Error = "", Warn = "", Hint = "", Info = "" }

	local function b(name)
		return function()
			return v.lsp.buf[name]()
		end
	end

	local function d(name)
		return function()
			return v.diagnostic[name]()
		end
	end

	-- https://neovim.io/doc/user/diagnostic.html#diagnostic-api
	key("n", "[dev]o", d("open_float"))
	key("n", "]g", d("goto_next"))
	key("n", "[g", d("goto_prev"))
	key("n", "[dev]q", d("setloclist"))

	for type, icon in pairs(signs) do
		local sign = "DiagnosticSign" .. type
		fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
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

	local on_attach = function(client, bufnr)
		api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		local opts = { noremap = true, silent = true, buffer = bufnr }
		-- https://neovim.io/doc/user/lsp.html#lsp-buf
		key("n", "H", b("hover"), opts)
		key("n", "[dev]f", b("format"), opts)
		key("n", "[dev]r", b("references"), opts)
		key("n", "[dev]d", b("definition"), opts)
		key("n", "[dev]D", b("declaration"), opts)
		key("n", "[dev]i", b("implementation"), opts)
		key("n", "[dev]t", b("type_definition"), opts)
		key("n", "[dev]n", b("rename"), opts)
		key("n", "[dev]a", b("code_action"), opts)
		key("n", "[dev]s", b("signature_help"), opts)
		key("n", "[dev]wa", b("add_workspace_folder"), opts)
		key("n", "[dev]wr", b("remove_workspace_folder"), opts)
		key("n", "[dev]wl", function()
			print(v.inspect(b("list_workspace_folders")))
		end, opts)

		if client.server_capabilities.documentHighlightProvider then
			hl(0, "LspReferenceText", {
				underline = true,
				bold = true,
				fg = "#A00000",
				bg = "#104040",
			})
			hl(0, "LspReferenceRead", {
				underline = true,
				bold = true,
				fg = "#A00000",
				bg = "#104040",
			})
			hl(0, "LspReferenceWrite", {
				underline = true,
				bold = true,
				fg = "#A00000",
				bg = "#104040",
			})
			local ldh = augroup("LspDocumentHighlight", {})
			autocmd({ "CursorHold", "CursorHoldI" }, { buffer = bufnr, callback = buf.document_highlight, group = ldh })
			autocmd({ "CursorMoved", "CursorMovedI" }, { buffer = bufnr, callback = buf.clear_references, group = ldh })
		end

		if client.server_capabilities.documentFormattingProvider then
			local my = augroup("documentFormattingProvider", {})
			autocmd("BufWritePre", {
				desc = "Auto format before save",
				buffer = bufnr,
				callback = function()
					buf.format({ timeout_ms = 2000 })
				end,
				group = my,
			})
		end
	end

	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities())

	require("mason-lspconfig").setup()
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	})
end

return M
