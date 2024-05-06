local M = {}

function M.alpha()
	local d = require("alpha.themes.dashboard")

	-- Banner
	d.section.header.val = {
		"                                                    ",
		" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                    ",
	}

	-- Menu
	d.section.buttons.val = {
		d.button("e", "󰝒 New file", ":ene <BAR> startinsert<CR>"),
		d.button("f", "󰱼 Find file", "<CMD>Telescope find_files<CR>"),
		d.button("g", "󱎸 Find word", "<CMD>Telescope live_grep<CR>"),
		d.button("t", "󰄲 Find TODO", "<CMD>TodoTelescope<CR>"),
		d.button("o", "󰌀 Open explorer", "<CMD>NvimTreeToggle<CR>"),
		d.button("c", "󰓙 Check health", "<CMD>checkhealth<CR>"),
		d.button("u", "󰚰 Update plugins", "<CMD>Lazy sync<CR>"),
		d.button("l", "󰏓 Open Package Maneger", "<CMD>Lazy<CR>"),
		d.button("m", "󰌱 Open Mason Maneger", "<CMD>Mason<CR>"),
		d.button("T", "󱫠 Measure time", "<CMD>StartupTime<CR>"),
		d.button("M", "󱩧 New Memo", ":MemoNew<CR>"),
		d.button("q", "󰩈 Quit", "<CMD>qa<CR>"),
	}

	-- Footer
	local function footer()
		local v = vim.version()
		local version = "v" .. v.major .. "." .. v.minor .. "." .. v.patch
		local datetime = os.date("%Y/%m/%d %H:%M:%S")

		return version .. " " .. datetime
	end

	d.section.footer.val = footer()

	require("alpha").setup(d.config)
end

function M.lualine()
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
			return v.fn["eskk#statusline"]()
		else
			return ""
		end
	end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "papercolor_dark",
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
				"branch",
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
				},
				"diagnostics",
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
					symbols = { modified = "  ", readonly = "  " },
				},
				search_result,
			},
			lualine_x = {
				{
					"aerial",
					depth = nil,
				},
			},
			lualine_y = {
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_z = {
				"progress",
				"location",
			},
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
		extensions = {
			"aerial",
			"quickfix",
			"fzf",
			"nvim-tree",
			"toggleterm",
			"lazy",
			"mason",
		},
	})
end

function M.scrollbar()
	require("scrollbar").setup()
end

function M.hlchunk()
	require("hlchunk").setup({
		chunk = {
			chars = {
				horizontal_line = "─",
				vertical_line = "│",
				left_top = "┌",
				left_bottom = "└",
				right_arrow = ">",
			},
			style = "#806d9c",
		},
		indent = {
			chars = { "│", "¦", "┆", "┊" },
			use_treesitter = true,
		},
		line_num = {
			enable = false,
		},
	})
end

return M
