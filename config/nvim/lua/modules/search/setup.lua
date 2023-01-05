local M = {}

function M.trouble()
	local key = vim.keymap.set
	key("n", "[tl]f", "<cmd>Trouble document_diagnostics<cr>")
	key("n", "[tl]w", "<cmd>Trouble workspace_diagnostics<cr>")
	key("n", "[tl]q", "<cmd>Trouble quickfix<cr>")
	key("n", "[tl]l", "<cmd>Trouble loclist<cr>")
	key("n", "[tl]/", "<cmd>Trouble lsp_references<cr>")
	key("n", "[tl]d", "<cmd>Trouble lsp_definitions<cr>")
	key("n", "[tl]t", "<cmd>Trouble lsp_type_definitions<cr>")
end

function M.telescope()
	local key = vim.keymap.set
	local function builtin(name)
		return function()
			return require("telescope.builtin")[name]()
		end
	end

	key("n", "[ff]f", builtin("find_files"))
	key("n", "[ff]p", builtin("git_files"))
	key("n", "[ff]g", builtin("live_grep"))
	key("n", "[ff]/", builtin("grep_string"))
	key("n", "[ff]b", builtin("buffers"))
	key("n", "[ff]l", builtin("current_buffer_fuzzy_find"))
	key("n", "[ff]gs", builtin("git_status"))
	key("n", "[ff]gc", builtin("git_commits"))
	key("n", "[ff]gC", builtin("git_bcommits"))
	key("n", "[ff]gb", builtin("git_branches"))
	key("n", "[ff]q", builtin("diagnostics"))
	key("n", "[ff]r", builtin("lsp_references"))
	key("n", "[ff]d", builtin("lsp_definitions"))
	key("n", "[ff]c", builtin("spell_suggest"))
end

function M.quickhl()
	local key = vim.keymap.set
	key("n", ",m", "<plug>(quickhl-manual-this)")
	key("x", ",m", "<plug>(quickhl-manual-this)")
	key("n", ",M", "<plug>(quickhl-manual-reset)")
	key("x", ",M", "<plug>(quickhl-manual-reset)")
end

function M.hlslens()
	local key = vim.keymap.set
	key("n", "n", [[<Cmd>execute('normal!'.v:count1.'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
	key("n", "N", [[<Cmd>execute('normal!'.v:count1.'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
	key("n", "*", function()
		require("lasterisk").search()
		require("hlslens").start()
	end)

	key({ "n", "x" }, "g*", function()
		require("lasterisk").search({ is_whole = false })
		require("hlslens").start()
	end)
	key("n", "<c-c>", "<Cmd>nohlsearch<CR>")
end

return M
