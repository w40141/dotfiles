local M = {}

function M.todo_comments()
	require("todo-comments").setup({
		signs = true,
		sign_priority = 8,
		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = "", color = "info" },
			HACK = { icon = "", color = "warning" },
			WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "", color = "hint", alt = { "INFO" } },
		},
		merge_keywords = true,
		highlight = {
			before = "",
			keyword = "wide",
			after = "",
			pattern = [[.*<(KEYWORDS)\s*:]],
			comments_only = true,
			max_line_len = 400,
			exclude = {},
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS):]],
		},
	})
end

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
	-- telescope.load_extension("yank_history")
	require("dressing").setup({})
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
					["<c-t>"] = trouble.open_with_trouble,
					["<C-g>"] = custom_actions.multiopen,
				},
				i = {
					["<C-x>"] = false,
					["<c-t>"] = trouble.open_with_trouble,
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
	-- local utils = require("yanky.utils")
	-- local mapping = require("yanky.telescope.mapping")
	-- local options = require("yanky.config").options
	-- options.picker.telescope.mappings = {
	-- 	default = mapping.put("p"),
	-- 	i = {
	-- 		["<A-p>"] = mapping.put("p"),
	-- 		["<A-P>"] = mapping.put("P"),
	-- 		["<A-d>"] = mapping.delete(),
	-- 		["<A-r>"] = mapping.set_register(utils.get_default_register()),
	-- 	},
	-- 	n = {
	-- 		p = mapping.put("p"),
	-- 		P = mapping.put("P"),
	-- 		d = mapping.delete(),
	-- 		r = mapping.set_register(utils.get_default_register()),
	-- 	},
	-- }
	-- require("yanky.config").setup(options)
end

-- function M.yanky()
-- 	require("yanky").setup({ ring = { storage = "sqlite" } })
-- end

return M
