local v = vim
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local custom_actions = {}
local cmd = v.cmd

function custom_actions.multiopen(prompt_bufnr)
	local picker = action_state.get_current_picker(prompt_bufnr)
	local num_selections = #picker:get_multi_selection()
	if num_selections > 1 then
		for _, entry in ipairs(picker:get_multi_selection()) do
			cmd(string.format("%s %s", ":e!", entry.value))
		end
		cmd("stopinsert")
	else
		actions.file_edit(prompt_bufnr)
	end
end

local trouble = require("trouble.providers.telescope")
telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		find_command = { "fd", "-t=f", "-a" },
		path_display = { shorten = { len = 5, exclude = { 5, -5 } } },
		wrap_results = true,
		dynamic_preview_title = true,
		winblend = 0,
		color_devicons = true,
		use_less = true,
		scroll_strategy = "cycle",
		set_env = { COLORTERM = "truecolor" },
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = {
				["<c-o>"] = trouble.open_with_trouble,
				["<C-g>"] = custom_actions.multiopen,
			},
			i = {
				["<C-x>"] = false,
				["<c-o>"] = trouble.open_with_trouble,
				["<C-g>"] = custom_actions.multiopen,
				["<CR>"] = actions.select_default + actions.center,
			},
		},
	},
})

local key = v.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
key("n", "[ff]p", builtin.find_files, opts)
key("n", "[ff]f", builtin.git_files, opts)
key("n", "[ff]g", builtin.live_grep, opts)
key("n", "[ff]/", builtin.grep_string, opts)
key("n", "[ff]b", builtin.buffers, opts)
key("n", "[ff]l", builtin.current_buffer_fuzzy_find, opts)
key("n", "[ff]gs", builtin.git_status, opts)
key("n", "[ff]gc", builtin.git_commits, opts)
key("n", "[ff]gC", builtin.git_bcommits, opts)
key("n", "[ff]gb", builtin.git_branches, opts)
key("n", "[ff]q", builtin.diagnostics, opts)
key("n", "[ff]r", builtin.lsp_references, opts)
key("n", "[ff]d", builtin.lsp_definitions, opts)
