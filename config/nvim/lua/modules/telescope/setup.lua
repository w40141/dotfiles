local M = {}

function M.todo_comments()
	local key = vim.keymap.set
	key("n", "[ff]o", "<cmd>TodoTelescope<CR>")
	key("n", "[ff]O", "<cmd>TodoTrouble<CR>")
	key("n", "[ff]oq", "<cmd>TodoQuickFix<CR>")
end

function M.trouble()
	local key = vim.keymap.set
	key("n", "[ff]Q", "<cmd>Trouble workspace_diagnostics<cr>")
	key("n", "[ff]R", "<cmd>Trouble lsp_references<cr>")
	key("n", "[ff]D", "<cmd>Trouble lsp_definitions<cr>")
	key("n", "[ff]T", "<cmd>Trouble lsp_type_definitions<cr>")
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
	key("n", "[ff]q", builtin("diagnostics"))
	key("n", "[ff]r", builtin("lsp_references"))
	key("n", "[ff]d", builtin("lsp_definitions"))
	key("n", "[ff]t", builtin("lsp_type_definitions"))
	key("n", "[ff]c", builtin("spell_suggest"))
	key("n", "[ff]gs", builtin("git_status"))
	key("n", "[ff]gc", builtin("git_commits"))
	key("n", "[ff]gC", builtin("git_bcommits"))
	key("n", "[ff]gb", builtin("git_branches"))
end

return M
