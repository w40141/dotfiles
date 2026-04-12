local M = {}

M.fidget = {
	notification = {
		window = {
			avoid = { "NvimTree" },
		},
	},
}

M.notify = {
	stages = "slide",
	background_colour = "FloatShadow",
	timeout = 3000,
}

M.noice = {
	cmdline = {
		format = {
			search_down = {
				kind = "search",
				pattern = "^/",
				icon = " ",
				lng = "regex",
			},
			search_up = {
				kind = "search",
				pattern = "^%?",
				icon = " ",
				lng = "regex",
			},
			filter = {
				pattern = "^:%s*!",
				icon = " ",
				lng = "bash",
			},
		},
	},
	lsp = {
		progress = {
			enabled = false,
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		hover = {
			enabled = true,
		},
		signature = {
			-- lsp_signature.nvimを使うためfalseにする
			enabled = true,
		},
		format = {
			spinner = {
				nme = "dots12",
			},
		},
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	views = {
		confirm = {
			position = {
				row = "90%",
				col = "90%",
			},
		},
	},
}

return M
