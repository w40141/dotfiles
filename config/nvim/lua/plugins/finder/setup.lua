local M = {}

function M.todo_comments()
	local key = vim.keymap.set
	key("n", "[ff]o", "<cmd>TodoTelescope<CR>", { desc = "Find TODO Comments" })
	key("n", "[ff]O", "<cmd>TodoTrouble<CR>", { desc = "Find TODO Comments in Trouble" })
	key("n", "[ff]u", "<cmd>TodoQuickFix<CR>", { desc = "Find TODO Comments in QuickFix" })
end

function M.trouble()
	local key = vim.keymap.set
	key("n", "[ff]Q", "<cmd>Trouble workspace_diagnostics<cr>", { desc = "Trouble Workspace Diagnostics" })
	key("n", "[ff]R", "<cmd>Trouble lsp_references<cr>", { desc = "Trouble LSP References" })
	key("n", "[ff]D", "<cmd>Trouble lsp_definitions<cr>", { desc = "Trouble LSP Definitions" })
	key("n", "[ff]T", "<cmd>Trouble lsp_type_definitions<cr>", { desc = "Trouble LSP Type Definitions" })
end

function M.telescope()
	local function f(name)
		return function()
			return require("telescope.builtin")[name]()
		end
	end

	local key = vim.keymap.set
	key("n", "[ff]f", f("find_files"), { desc = "Find Files" })
	key("n", "[ff]p", f("git_files"), { desc = "Git Files" })
	key("n", "[ff]g", f("live_grep"), { desc = "Live Grep" })
	key("n", "[ff]/", f("grep_string"), { desc = "Grep String" })
	key("n", "[ff]b", f("buffers"), { desc = "Buffers" })
	key("n", "[ff]l", f("current_buffer_fuzzy_find"), { desc = "Current Buffer Fuzzy Find" })
	key("n", "[ff]q", f("diagnostics"), { desc = "Diagnostics" })
	key("n", "[ff]r", f("lsp_references"), { desc = "LSP References" })
	key("n", "[ff]d", f("lsp_definitions"), { desc = "LSP Definitions" })
	key("n", "[ff]t", f("lsp_type_definitions"), { desc = "LSP Type Definitions" })
	key("n", "[ff]c", f("spell_suggest"), { desc = "Spell Suggest" })
	key("n", "[ff]gs", f("git_status"), { desc = "Git Status" })
	key("n", "[ff]gc", f("git_commits"), { desc = "Git Commits" })
	key("n", "[ff]gC", f("git_bcommits"), { desc = "Git BCommits" })
	key("n", "[ff]gb", f("git_branches"), { desc = "Git Branches" })
	key("n", "[ff]ml", "<cmd>Telescope memo list<cr>", { desc = "Memo List" })
	key("n", "[ff]mg", "<cmd>Telescope memo live_grep<cr>", { desc = "Memo Live Grep" })
end

return M
