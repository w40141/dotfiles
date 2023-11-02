local M = {}

function M.todo_comments()
	require("todo-comments").setup({
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		-- keywords recognized as todo comments
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = "󰈸 ", color = "warning" },
			WARN = { icon = "󰒡 ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = "󱤎 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		-- highlighting of the line containing the todo comment
		-- * before: highlights before the keyword (typically comment characters)
		-- * keyword: highlights of the keyword
		-- * after: highlights after the keyword (todo text)
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
		-- list of named colors where we try to extract the guifg from the
		-- list of highlight groups or use the hex color if hl not found as a fallback
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "Identifier", "#FF00FF" },
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
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
			-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
		},
	})
end

function M.trouble()
	require("trouble").setup({
		action_keys = {
			close = "q",
			cancel = { "<c-c>", "<esc>" },
			refresh = "r",
			jump = { "<cr>", "l" },
			open_split = { "<c-x>" },
			open_vsplit = { "<c-v>" },
			open_tab = { "<c-t>" },
			jump_close = { "o" },
			toggle_mode = "m",
			toggle_preview = "P",
			hover = "H",
			preview = "p",
			close_folds = { "zM", "zm" }, -- close all folds
			open_folds = { "zR", "zr" }, -- open all folds
			toggle_fold = { "<tab>" }, -- toggle fold of current file
			previous = "k",
			next = "j",
		},
		auto_close = true,
		auto_preview = true,
		auto_fold = true,
		auto_jump = { "lsp_definitions" },
		use_diagnostic_signs = true,
	}) -- Lua
end

function M.telescope()
	local v = vim
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local trouble = require("trouble.providers.telescope")
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
				i = {
					["<C-t>"] = trouble.open_with_trouble,
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
					["<C-t>"] = trouble.open_with_trouble,
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
				},
			},
		},
		extensions = {
			aerial = {
				show_nesting = {
					["_"] = false,
					json = true,
					yaml = true,
				},
			},
		},
	})
end

return M
