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
	d.section.header.opts.hl = "AlphaHeader"

	-- Menu
	d.section.buttons.val = {
		d.button("e", "󰝒 New file", ":ene <bar> startinsert<cr>"),
		d.button("f", "󰱼 Find file", "<cmd>Telescope find_files<cr>"),
		d.button("g", "󱎸 Find word", "<cmd>Telescope live_grep<cr>"),
		d.button("t", "󰄲 Find TODO", "<cmd>TodoTelescope<cr>"),
		d.button("o", "󰌀 Open explorer", "<cmd>NvimTreeToggle<cr>"),
		d.button("c", "󰓙 Check health", "<cmd>checkhealth<cr>"),
		d.button("u", "󰚰 Update plugins", "<cmd>Lazy sync<cr>"),
		d.button("l", "󰏓 Open Package Maneger", "<cmd>Lazy<cr>"),
		d.button("m", "󰌱 Open Mason Maneger", "<cmd>Mason<cr>"),
		d.button("T", "󱫠 Measure time", "<cmd>StartupTime<cr>"),
		d.button("M", "󱩧 New Memo", ":MemoNew<cr>"),
		d.button("q", "󰩈 Quit", "<cmd>qa<cr>"),
	}
	d.section.buttons.opts.hl = "AlphaButtons"

	-- Footer
	local function footer()
		local v = vim.version()
		local version = "v" .. v.major .. "." .. v.minor .. "." .. v.patch
		local datetime = os.date("%Y/%m/%d %H:%M:%S")

		return version .. " " .. datetime
	end

	d.section.footer.val = footer()
	d.section.footer.opts.hl = "AlphaFooter"

	require("alpha").setup(d.config)
end

function M.lualine()
	local v = vim

	local function skk()
		if (v.fn.mode() == "i") and v.fn["skkeleton#is_enabled"]() then
			return v.fn["skkeleton#mode"]()
		else
			return ""
		end
	end

	local function lsp_status()
		local clients = v.lsp.get_clients({ bufnr = 0 })
		if #clients == 0 then
			return "No Active Lsp"
		end
		local names = {}
		for _, client in ipairs(clients) do
			table.insert(names, client.name)
		end
		return table.concat(names, ", ")
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
					-- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory
					path = 4,
					symbols = { modified = "  ", readonly = "  " },
				},
				-- search_result,
			},
			lualine_x = {
				{
					"aerial",
					depth = nil,
				},
			},
			lualine_y = {
				"filetype",
				{
					lsp_status,
					icon = " LSP:",
					color = { fg = "#000000", gui = "bold" },
				},
			},
			lualine_z = {
				"encoding",
				"fileformat",
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
			enable = true,
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
			enable = true,
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

function M.aerial()
	require("aerial").setup({
		backends = { "lsp", "treesitter", "markdown", "man" },
		close_automatic_events = { "unsupported" },
		default_bindings = true,
		disable_max_lines = 10000,
		filter_kind = {
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Struct",
		},
		-- Enum: split_width, full_width, last, none
		-- Determines line highlighting mode when multiple splits are visible
		-- split_width   Each open window will have its cursor location marked in the
		--               aerial buffer. Each line will only be partially highlighted
		--               to indicate which window is at that location.
		-- full_width    Each open window will have its cursor location marked as a
		--               full-width highlight in the aerial buffer.
		-- last          Only the most-recently focused window will have its location
		--               marked in the aerial buffer.
		-- none          Do not show the cursor locations in the aerial window.
		highlight_mode = "split_width",
		-- When jumping to a symbol, highlight the line for this many ms.
		-- Set to false to disable
		highlight_on_jump = 300,
		-- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
		-- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
		-- default collapsed icon. The default icon set is determined by the
		-- "nerd_font" option below.
		-- If you have lspkind-nvim installed, aerial will use it for icons.
		-- icons = {},

		-- When you fold code with za, zo, or zc, update the aerial tree as well.
		-- Only works when manage_folds = true
		link_folds_to_tree = false,
		-- Fold code when you open/collapse symbols in the tree.
		-- Only works when manage_folds = true
		link_tree_to_folds = true,
		-- Use symbol tree for folding. Set to true or false to enable/disable
		-- 'auto' will manage folds if your previous foldmethod was 'manual'
		manage_folds = false,
		layout = {
			-- Enum: prefer_right, prefer_left, right, left, float
			-- Determines the default direction to open the aerial window. The 'prefer'
			-- options will open the window in the other direction *if* there is a
			-- different buffer in the way of the preferred direction
			default_direction = "prefer_right",
			-- The maximum width of the aerial window
			max_width = { 40, 0.3 },
			-- The minimum width of the aerial window.
			-- To disable dynamic resizing, set this to be equal to max_width
			min_width = 10,
			-- Set to true to only open aerial at the far right/left of the editor
			-- Default behavior opens aerial relative to current window
			placement_editor_edge = false,
		},
		-- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
		-- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
		nerd_font = "auto",
		-- Call this function when aerial attaches to a buffer.
		-- Useful for setting keymaps. Takes a single `bufnr` argument.
		on_attach = nil,
		-- Automatically open aerial when entering supported buffers.
		-- This can be a function (see :help aerial-open-automatic)
		open_automatic = false,
		-- Run this command after jumping to a symbol (false will disable)
		post_jump_cmd = "normal! zz",
		-- When true, aerial will automatically close after jumping to a symbol
		close_on_select = false,
		-- Show box drawing characters for the tree hierarchy
		show_guides = false,
		-- Options for opening aerial in a floating win
		float = {
			-- Controls border appearance. Passed to nvim_open_win
			border = "rounded",
			-- The maximum height of the floating aerial window
			max_height = 100,
			-- The minimum height of the floating aerial window
			-- To disable dynamic resizing, set this to be equal to max_height
			min_height = 4,
		},
		lsp = {
			-- Fetch document symbols when LSP diagnostics change.
			-- If you set this to false, you will need to manually fetch symbols
			diagnostics_trigger_update = true,
			-- Set to false to not update the symbols when there are LSP errors
			update_when_errors = true,
		},
		treesitter = {
			-- How long to wait (in ms) after a buffer change before updating
			update_delay = 300,
		},
		markdown = {
			-- How long to wait (in ms) after a buffer change before updating
			update_delay = 300,
		},
	})
end

function M.tree()
	local api = require("nvim-tree.api")
	local key = vim.keymap.set

	local function on_attach(bufnr)
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)

		key("n", "l", api.tree.change_root_to_node, opts("CD"))
		key("n", "h", api.tree.change_root_to_parent, opts("Up"))
		key("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))
		key("n", "?", api.tree.toggle_help, opts("Help"))
		key("n", "sl", "<C-w>w", opts("Back Display"))
	end

	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		on_attach = on_attach,
		view = {
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
	})
end

return M
