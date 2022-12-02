local v = vim
local fn = v.fn
local key = v.keymap.set
local diagnostic = v.diagnostic
local lsp = v.lsp
local inspect = v.inspect
local buf = lsp.buf
local opts = { noremap = true, silent = true }

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local sign = "DiagnosticSign" .. type
	fn.sign_define(sign, { text = icon, texthl = sign, numhl = sign })
end

key("n", "[dev]o", diagnostic.open_float, opts)
key("n", "]g", diagnostic.goto_next, opts)
key("n", "[g", diagnostic.goto_prev, opts)
key("n", "[dev]q", diagnostic.setloclist, opts)

key("n", "H", buf.hover)
key("n", "[dev]f", buf.format)
key("n", "[dev]r", buf.references)
key("n", "[dev]d", buf.definition)
key("n", "[dev]D", buf.declaration)
key("n", "[dev]i", buf.implementation)
key("n", "[dev]t", buf.type_definition)
key("n", "[dev]n", buf.rename)
key("n", "[dev]a", buf.code_action)
key("n", "[dev]s", buf.signature_help)
key("n", "[dev]wa", buf.add_workspace_folder)
key("n", "[dev]wr", buf.remove_workspace_folder)
key("n", "[dev]wl", function()
	print(inspect(buf.list_workspace_folders()))
end)

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = false,
	virtual_text = {
		format = function(d)
			return string.format("%s (%s: %s)", d.message, d.source, d.code)
		end,
	},
})
