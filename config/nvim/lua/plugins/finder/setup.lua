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
	local function b(name)
		return function()
			return require("telescope.builtin")[name]()
		end
	end

	key("n", "[ff]f", b("find_files"))
	key("n", "[ff]p", b("git_files"))
	key("n", "[ff]g", b("live_grep"))
	key("n", "[ff]/", b("grep_string"))
	key("n", "[ff]b", b("buffers"))
	key("n", "[ff]l", b("current_buffer_fuzzy_find"))
	key("n", "[ff]q", b("diagnostics"))
	key("n", "[ff]r", b("lsp_references"))
	key("n", "[ff]d", b("lsp_definitions"))
	key("n", "[ff]t", b("lsp_type_definitions"))
	key("n", "[ff]c", b("spell_suggest"))
	key("n", "[ff]gs", b("git_status"))
	key("n", "[ff]gc", b("git_commits"))
	key("n", "[ff]gC", b("git_bcommits"))
	key("n", "[ff]gb", b("git_branches"))
	key("n", "[ff]ml", "<cmd>Telescope memo list<cr>")
	key("n", "[ff]mg", "<cmd>Telescope memo live_grep<cr>")
end

return M
