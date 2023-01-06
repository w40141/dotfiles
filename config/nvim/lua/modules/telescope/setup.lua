local M = {}

function M.todo_comments()
	local key = vim.keymap.set
	key("n", "[ff]t", "<cmd>TodoTelescope<CR>")
end

function M.trouble()
	local key = vim.keymap.set
	key("n", "[tr]f", "<cmd>Trouble document_diagnostics<cr>")
	key("n", "[tr]w", "<cmd>Trouble workspace_diagnostics<cr>")
	key("n", "[tr]q", "<cmd>Trouble quickfix<cr>")
	key("n", "[tr]l", "<cmd>Trouble loclist<cr>")
	key("n", "[tr]/", "<cmd>Trouble lsp_references<cr>")
	key("n", "[tr]d", "<cmd>Trouble lsp_definitions<cr>")
	key("n", "[tr]t", "<cmd>Trouble lsp_type_definitions<cr>")
end

function M.telescope()
	local key = vim.keymap.set
	local function builtin(name)
		return function()
			return require("telescope.builtin")[name]()
		end
	end

	local function extensions(name, prop)
		return function(opt)
			return function()
				local telescope = require("telescope")
				telescope.load_extension(name)
				return telescope.extensions[name][prop](opt or {})
			end
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
	key("n", "<Leader>fy", extensions("yank_history", "yank_history")({}))
end

function M.yanky()
	local key = vim.keymap.set
	key({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	key({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	key({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
	key({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
	key("n", "<A-n>", "<Plug>(YankyCycleForward)")
	key("n", "<A-p>", "<Plug>(YankyCycleBackward)")
	key("n", "<A-y>", "<Cmd>YankyRingHistory<CR>")
end

return M
