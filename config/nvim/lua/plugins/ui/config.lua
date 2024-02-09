local M = {}

function M.kanagawa()
	-- Default options:
	require("kanagawa").setup({
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		theme = "wave", -- Load "wave" theme when 'background' option is not set
		background = {
			-- map the value of 'background' option to a theme
			dark = "dragon", -- try "dragon" !
			light = "lotus",
		},
	})

	vim.cmd("colorscheme kanagawa")
end

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

function M.indent_blankline()
	local highlight = {
		"CursorColumn",
		"Whitespace",
	}
	require("ibl").setup({
		indent = { highlight = highlight, char = "" },
		whitespace = {
			highlight = highlight,
			remove_blankline_trail = false,
		},
		scope = { enabled = false },
	})
end

function M.noice()
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
				-- lsp_signature.nvimを使うためfalseにする
				enabled = false,
			},
			format = {
				spinner = {
					name = "dots12",
				},
			},
		},
		cmdline = {
			format = {
				search_down = {
					kind = "search",
					pattern = "^/",
					icon = " ",
					lang = "regex",
				},
				search_up = {
					kind = "search",
					pattern = "^%?",
					icon = " ",
					lang = "regex",
				},
				filter = {
					pattern = "^:%s*!",
					icon = " ",
					lang = "bash",
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
	})
end

function M.notify()
	require("notify").setup({
		stages = "slide",
		background_colour = "FloatShadow",
		timeout = 3000,
	})
end

function M.scrollbar()
	require("scrollbar").setup()
end

function M.nvimTree()
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

function M.dressing()
	require("dressing").setup()
end

function M.hlchunk()
	require("hlchunk").setup({
		indent = {
			chars = { "│", "¦", "┆", "┊" },
			use_treesitter = true,
		},
		line_num = {
			enable = false,
		},
	})
end

function M.fidget()
	require("fidget").setup({
		-- Options related to LSP progress subsystem
		progress = {
			poll_rate = 0, -- How and when to poll for progress messages
			suppress_on_insert = false, -- Suppress new messages while in insert mode
			ignore_done_already = false, -- Ignore new tasks that are already complete
			ignore_empty_message = false, -- Ignore new tasks that don't contain a message
			-- Clear notification group when LSP server detaches
			clear_on_detach = function(client_id)
				local client = vim.lsp.get_client_by_id(client_id)
				return client and client.name or nil
			end,
			-- How to get a progress message's notification group key
			notification_group = function(msg)
				return msg.lsp_client.name
			end,
			ignore = {}, -- List of LSP servers to ignore

			-- Options related to how LSP progress messages are displayed as notifications
			display = {
				render_limit = 16, -- How many LSP messages to show at once
				done_ttl = 3, -- How long a message should persist after completion
				done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
				done_style = "Constant", -- Highlight group for completed LSP tasks
				progress_ttl = math.huge, -- How long a message should persist when in progress
				-- Icon shown when LSP progress tasks are in progress
				progress_icon = { pattern = "dots", period = 1 },
				-- Highlight group for in-progress LSP tasks
				progress_style = "WarningMsg",
				group_style = "Title", -- Highlight group for group name (LSP server name)
				icon_style = "Question", -- Highlight group for group icons
				priority = 30, -- Ordering priority for LSP notification group
				skip_history = true, -- Whether progress notifications should be omitted from history
				-- How to format a progress message
				format_message = require("fidget.progress.display").default_format_message,
				-- How to format a progress annotation
				format_annote = function(msg)
					return msg.title
				end,
				-- How to format a progress notification group's name
				format_group_name = function(group)
					return tostring(group)
				end,
				overrides = { -- Override options from the default notification config
					rust_analyzer = { name = "rust-analyzer" },
				},
			},

			-- Options related to Neovim's built-in LSP client
			lsp = {
				progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
				log_handler = false, -- Log `$/progress` handler invocations (for debugging)
			},
		},

		-- Options related to notification subsystem
		notification = {
			poll_rate = 10, -- How frequently to update and render notifications
			filter = vim.log.levels.INFO, -- Minimum notifications level
			history_size = 128, -- Number of removed messages to retain in history
			override_vim_notify = false, -- Automatically override vim.notify() with Fidget
			-- How to configure notification groups when instantiated
			configs = { default = require("fidget.notification").default_config },
			-- Conditionally redirect notifications to another backend
			redirect = function(msg, level, opts)
				if opts and opts.on_open then
					return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
				end
			end,

			-- Options related to how notifications are rendered as text
			view = {
				stack_upwards = true, -- Display notification items from bottom to top
				icon_separator = " ", -- Separator between group name and icon
				group_separator = "---", -- Separator between notification groups
				-- Highlight group used for group separator
				group_separator_hl = "Comment",
				-- How to render notification messages
				render_message = function(msg, cnt)
					return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
				end,
			},

			-- Options related to the notification window and buffer
			window = {
				normal_hl = "Comment", -- Base highlight group in the notification window
				winblend = 100, -- Background color opacity in the notification window
				border = "none", -- Border around the notification window
				zindex = 45, -- Stacking priority of the notification window
				max_width = 0, -- Maximum width of the notification window
				max_height = 0, -- Maximum height of the notification window
				x_padding = 1, -- Padding from right edge of window boundary
				y_padding = 0, -- Padding from bottom edge of window boundary
				align = "bottom", -- How to align the notification window
				relative = "editor", -- What the notification window position is relative to
			},
		},

		-- Options related to integrating with other plugins
		integration = {
			["nvim-tree"] = {
				enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
			},
			["xcodebuild-nvim"] = {
				enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
			},
		},

		-- Options related to logging
		logger = {
			level = vim.log.levels.WARN, -- Minimum logging level
			max_size = 10000, -- Maximum log file size, in KB
			float_precision = 0.01, -- Limit the number of decimals displayed for floats
			-- Where Fidget writes its logs to
			path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
		},
	})
end

return M
