local M = {}

function M.previm()
	local v = vim
	local g = v.g
	g.previm_open_cmd = [[open -a Google\ Chrome]]
	g.previm_enable_realtime = 1
	v.keymap.set("n", ",o", "<Cmd>PrevimOpen<cr>")
end

-- TODO: mason-lspconfig との連携
function M.rust()
	local v = vim
	local api = v.api
	local key = v.keymap.set
	local hl = api.nvim_set_hl
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd
	local buf = v.lsp.buf
	local rt = require("rust-tools")
	rt.setup({
		server = {
			on_attach = function(_, bufnr)
				api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

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
				autocmd(
					{ "CursorHold", "CursorHoldI" },
					{ buffer = bufnr, callback = buf.document_highlight, group = ldh }
				)
				autocmd(
					{ "CursorMoved", "CursorMovedI" },
					{ buffer = bufnr, callback = buf.clear_references, group = ldh }
				)

				key("n", "H", rt.hover_actions.hover_actions, { buffer = bufnr })
				key("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			end,
		},
	})
end

return M
