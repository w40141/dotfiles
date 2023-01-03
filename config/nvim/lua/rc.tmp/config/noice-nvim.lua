return {
	function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					enabled = true,
				},
				signature = {
					enabled = true,
				},
				format = {
					spinner = {
						name = "dots12",
						--name = "sand",
					},
				},
			},
			cmdline = {
				format = {
					search_down = {
						kind = "search", pattern = "^/", icon = " ", lang = "regex"
					},
					search_up = {
						kind = "search", pattern = "^%?", icon = " ", lang = "regex"
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
				}
			}
		})
	end,
}
