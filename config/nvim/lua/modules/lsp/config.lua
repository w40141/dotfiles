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
	local hl = api.nvim_set_hl
	local lsp = v.lsp
	local buf = lsp.buf
	local augroup = v.api.nvim_create_augroup
	local autocmd = v.api.nvim_create_autocmd
	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
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

		-- if client.server_capabilities.documentFormattingProvider then
		-- 	local my = augroup("documentFormattingProvider", {})
		-- 	autocmd("BufWritePre", {
		-- 		desc = "Auto format before save",
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			buf.format({ bufnr = bufnr, timeout_ms = 2000 })
		-- 		end,
		-- 		group = my,
		-- 	})
		-- end
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

function M.lspsaga()
	local lspsaga = require("lspsaga")
	lspsaga.setup({ -- defaults ...
		debug = false,
		use_saga_diagnostic_sign = true,
		error_sign = "",
		warn_sign = "",
		hint_sign = "",
		infor_sign = "",
		diagnostic_header_icon = "   ",
		-- code action title icon
		code_action_icon = " ",
		code_action_prompt = {
			enable = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
		finder_definition_icon = "  ",
		finder_reference_icon = "  ",
		max_preview_lines = 10,
		finder_action_keys = {
			open = "o",
			vsplit = "v",
			split = "p",
			quit = "q",
			scroll_down = "<C-f>",
			scroll_up = "<C-b>",
		},
		code_action_keys = {
			quit = "q",
			exec = "<CR>",
		},
		rename_action_keys = {
			quit = "<C-c>",
			exec = "<CR>",
		},
		definition_preview_icon = "  ",
		border_style = "single",
		rename_prompt_prefix = "➤",
		rename_output_qflist = {
			enable = false,
			auto_open_qflist = false,
		},
		server_filetype_map = {},
		diagnostic_prefix_format = "%d. ",
		diagnostic_message_format = "%m %c",
		highlight_prefix = false,
	})
end

return M
