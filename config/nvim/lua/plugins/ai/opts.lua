local M = {}

M.copilot = {
	panel = {
		enabled = true,
		auto_refresh = true,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<C-[>",
		},
		layout = {
			position = "bottom",
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = false,
		hide_during_completion = true,
		debounce = 75,
		keymap = {
			accept = "<M-l>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = true,
		markdown = true,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 18.x
	server_opts_overrides = {},
}

M.avante = {
	provider = "copilot", -- copilotを使用
	-- auto_suggestions_provider = "copilot", -- 自動提案もcopilotを使用

	behaviour = {
		auto_suggestions = false,
		auto_set_highlight_group = true,
		auto_set_keymaps = true,
		auto_apply_diff_after_generation = true,
		support_paste_from_clipboard = true,
		minimize_diff = true,
	},

	windows = {
		position = "right",
		wrap = true,
		width = 30,
		sidebar_header = {
			enabled = true,
			align = "center",
			rounded = true,
		},
		input = {
			prefix = "> ",
			height = 8,
		},
		edit = {
			border = "rounded",
			start_insert = true,
		},
		ask = {
			floating = false,
			start_insert = true,
			border = "rounded",
			focus_on_apply = "ours",
		},
	},
}

return M
