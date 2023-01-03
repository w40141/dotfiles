return {
	function()
		local key = vim.keymap.set
		local function builtin(name)
			return function()
				return require("telescope.builtin")[name]()
			end
		end

		key("n", "[ff]f", builtin "find_files")
		key("n", "[ff]p", builtin "git_files")
		key("n", "[ff]g", builtin "live_grep")
		key("n", "[ff]/", builtin "grep_string")
		key("n", "[ff]b", builtin "buffers")
		key("n", "[ff]l", builtin "current_buffer_fuzzy_find")
		key("n", "[ff]gs", builtin "git_status")
		key("n", "[ff]gc", builtin "git_commits")
		key("n", "[ff]gC", builtin "git_bcommits")
		key("n", "[ff]gb", builtin "git_branches")
		key("n", "[ff]q", builtin "diagnostics")
		key("n", "[ff]r", builtin "lsp_references")
		key("n", "[ff]d", builtin "lsp_definitions")
	end
}
