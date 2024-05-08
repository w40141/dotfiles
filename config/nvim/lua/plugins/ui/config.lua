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

function M.bufferline()
	local fn = vim.fn

	require("bufferline").setup({
		options = {
			numbers = "ordinal",
			close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			indicator = { icon = "▎", stype = "icon" },
			modified_icon = "",
			close_icon = "",
			-- left_trunc_marker = '',
			-- right_trunc_marker = '',
			--- name_formatter can be used to change the buffer's label in the bufferline.
			--- Please note some names can/will break the
			--- bufferline so use this at your discretion knowing that it has
			--- some limitations that will *NOT* be fixed.
			name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
				-- remove extension from markdown files for example
				if buf.name:match("%.md") then
					return fn.fnamemodify(buf.name, ":t:r")
				end
			end,
			max_name_length = 15,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
			tab_size = 15,
			offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
			color_icons = true, -- whether or not to add the filetype icon highlights
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "thin",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = "directory",
		},
	})
end

function M.kanagawa()
	require("kanagawa").setup({
		background = {
			dark = "dragon",
			light = "lotus",
		},
	})

	vim.cmd("colorscheme kanagawa")
end

return M
