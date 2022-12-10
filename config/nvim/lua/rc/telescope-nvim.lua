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

