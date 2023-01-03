return {
	function()
		local v = vim
		local function search_result()
			if v.v.hlsearch == 0 then
				return ""
			end
			local last_search = v.fn.getreg("/")
			if not last_search or last_search == "" then
				return ""
			end
			local searchcount = v.fn.searchcount({ maxcount = 9999 })
			return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
		end

		local function skk()
			if (v.fn.mode() == "i") and v.fn["eskk#is_enabled"]() then
				return v.fn['eskk#statusline']()
			else
				return ""
			end
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "kanagawa",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
					skk,
				},
				lualine_b = {
					{
						"filename",
						file_status = true,
						path = 0,
						symbols = { modified = "  ", readonly = "  " }
					},
					search_result,
				},
				lualine_c = {
					{
						"diagnostics",
						sources = {
							"nvim_diagnostic",
						},
						sections = { "error", "warn", "info", "hint" },
						diagnostics_color = {
							error = "DiagnosticError",
							warn = "DiagnosticWarn",
							info = "DiagnosticInfo",
							hint = "DiagnosticHint",
						},
						symbols = { Error = "", Warn = "", Hint = "", Info = "" },
						colored = true,
					},
				},
				lualine_x = {
					"aerial",
					depth = nil,
				},
				lualine_y = {
					{
						"diff",
						colored = true,
						diff_color = {
							added = "DiffAdd",
							modified = "DiffChange",
							removed = "DiffDelete",
						},
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"branch",
				},
				lualine_z = { "location", "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { { "filetype", icon_only = true } },
				lualine_z = {},
			},
			tabline = {},
			extensions = { "quickfix", "fzf", "nvim-tree", "toggleterm" },
		})
	end
}
