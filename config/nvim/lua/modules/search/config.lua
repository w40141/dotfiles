local M = {}

function M.trouble()
	require("trouble").setup({
		position = "bottom", -- position of the list can be: bottom, top, left, right
		height = 10, -- height of the trouble list when position is top or bottom
		icons = true, -- use devicons for filenames
		mode = "workspace_diagnostics",
		fold_open = "", -- icon used for open folds
		fold_closed = "", -- icon used for closed folds
		group = true, -- group results by file
		padding = true, -- add an extra new line on top of the list
		action_keys = { -- key mappings for actions in the trouble list
			-- map to {} to remove a mapping, for example: close = {},
			close = "q", -- close the list
			cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
			refresh = "r", -- manually refresh
			jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
			open_split = { "<c-x>" }, -- open buffer in new split
			open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
			open_tab = { "<c-t>" }, -- open buffer in new tab
			jump_close = { "o" }, -- jump to the diagnostic and close the list
			toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
			toggle_preview = "P", -- toggle auto_preview
			hover = "K", -- opens a small popup with the full multiline message
			preview = "p", -- preview the diagnostic location
			close_folds = { "zM", "zm" }, -- close all folds
			open_folds = { "zR", "zr" }, -- open all folds
			toggle_fold = { "zA", "za" }, -- toggle fold of current file
			previous = "k", -- preview item
			next = "j", -- next item
		},
		-- add an indent guide below the fold icons
		indent_lines = true,
		-- automatically open the list when you have diagnostics
		auto_open = false,
		-- automatically close the list when you have no diagnostics
		auto_close = true,
		-- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
		auto_preview = true,
		-- automatically fold a file trouble list at creation
		auto_fold = true,
		-- for the given modes, automatically jump if there is only a single result
		auto_jump = { "lsp_definitions" },
		-- enabling this will use the signs defined in your lsp client
		use_diagnostic_signs = true,
	}) -- Lua
end

function M.telescope()
	local v = vim
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	-- local aerial = require('telescope').load_extension('aerial')
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

	telescope.load_extension("aerial")
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
		extensions = {
			aerial = {
				-- Display symbols as <root>.<parent>.<symbol>
				show_nesting = {
					["_"] = false, -- This key will be the default
					json = true, -- You can set the option for specific filetypes
					yaml = true,
				},
			},
		},
	})
end

function M.hlslens()
	require("hlslens").setup()
end

return M
