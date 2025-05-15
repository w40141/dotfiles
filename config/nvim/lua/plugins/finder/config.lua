local M = {}

function M.telescope()
	local v = vim
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local trouble = require("trouble.sources.telescope")
	local custom_actions = {}
	local cmd = v.cmd

	function custom_actions.multiopen(prompt_bufnr)
		local picker = action_state.get_current_picker(prompt_bufnr)
		local num_selections = #picker:get_multi_selection()
		if num_selections >= 1 then
			for _, entry in ipairs(picker:get_multi_selection()) do
				cmd(string.format("%s %s", ":e!", entry.value))
			end
		else
			actions.file_edit(prompt_bufnr)
		end
	end
	telescope.setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--hidden",
				"--glob",
				"!**/.git/**",
				"--column",
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
				i = {
					["<C-t>"] = trouble.open,
					["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-g>"] = custom_actions.multiopen,
					["<C-h>"] = actions.which_key,
					["<C-q>"] = actions.close,
					["<CR>"] = actions.select_default + actions.center,
					["<C-v>"] = actions.select_vertical,
					["<C-n>"] = actions.move_selection_next,
					["<C-p>"] = actions.move_selection_previous,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				},
				n = {
					["<C-t>"] = trouble.open,
					["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-g>"] = custom_actions.multiopen,
					["<C-h>"] = actions.which_key,
					["?"] = actions.which_key,
					["q"] = actions.close,
					["<CR>"] = actions.select_default,
					["<C-v>"] = actions.select_vertical,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,
					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				},
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({
					-- even more opts
				}),
			},
			aerial = {
				show_nesting = {
					["_"] = false,
					json = true,
					yaml = true,
				},
			},
		},
	})
	telescope.load_extension("ui-select")
	telescope.load_extension("aerial")
	telescope.load_extension("memo")
	telescope.load_extension("textcase")
end

return M
