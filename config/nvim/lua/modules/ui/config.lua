local M = {}

-- function M.kanagawa()
-- 	vim.cmd("colorscheme kanagawa")
-- end

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
		d.button("e", " New file", ":ene <BAR> startinsert<CR>"),
		d.button("f", " Find file", "<cmd>Telescope find_files<CR>"),
		d.button("g", " Find word", "<cmd>Telescope live_grep<CR>"),
		d.button("o", "פּ Open explorer", "<cmd>lua require('lir.float').toggle()<cr>"),
		d.button("s", " Settings", ":e $MYVIMRC<CR>"),
		d.button("c", "﫵Check health", "<cmd>checkhealth<cr>"),
		d.button("u", " Update plugins", "<cmd>PackerSync<CR>"),
		d.button("m", " Open Mason Maneger", "<cmd>MasonToolsUpdate<CR>"),
		d.button("t", " Measure time", "<cmd>StartupTime<CR>"),
		d.button("q", " Quit", "<cmd>qa<CR>"),
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
		backends = { "lsp", "treesitter", "markdown" },
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
			numbers = "buffer_id",
			close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			indicator = { icon = "▎", stype = "icon" },
			buffer_close_icon = "",
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
					symbols = { modified = "  ", readonly = "  " },
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

function M.indnt_blankline()
	require("indent_blankline").setup({
		indent_blankline_use_treesitter = true,
		show_current_context = true,
		-- show_current_context_start = true,
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
				enabled = false,
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
					kind = "search",
					pattern = "^/",
					icon = " ",
					lang = "regex",
				},
				search_up = {
					kind = "search",
					pattern = "^%?",
					icon = " ",
					lang = "regex",
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

function M.gitsigns()
	local v = vim
	local set = v.keymap.set
	local diff = v.wo.diff
	local schedule = v.schedule

	require("gitsigns").setup({
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if diff then
					return "]c"
				end
				schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if diff then
					return "[c"
				end
				schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			-- Actions
			map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
			map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
			map("n", "<leader>hS", gs.stage_buffer)
			map("n", "<leader>hu", gs.undo_stage_hunk)
			map("n", "<leader>hR", gs.reset_buffer)
			map("n", "<leader>hp", gs.preview_hunk)
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end)
			map("n", "<leader>tb", gs.toggle_current_line_blame)
			map("n", "<leader>hd", gs.diffthis)
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end)
			map("n", "<leader>td", gs.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
		signcolumn = false,
		numhl = true,
		linehl = false,
		word_diff = false,
	})
end

function M.lir()
	local v = vim
	local actions = require("lir.actions")
	local mark_actions = require("lir.mark.actions")
	local clipboard_actions = require("lir.clipboard.actions")

	require("lir").setup({
		show_hidden_files = true,
		ignore = {},
		devicons_enable = true,
		mappings = {
			["l"] = actions.edit,
			["<c-s>"] = actions.split,
			["<c-v>"] = actions.vsplit,
			["<c-t>"] = actions.tabedit,

			["h"] = actions.up,
			["q"] = actions.quit,

			["K"] = actions.mkdir,
			["N"] = actions.newfile,
			["R"] = actions.rename,
			["@"] = actions.cd,
			["Y"] = actions.yank_path,
			["."] = actions.toggle_show_hidden,
			["D"] = actions.delete,

			["J"] = function()
				mark_actions.toggle_mark()
				v.cmd("normal! j")
			end,
			["C"] = clipboard_actions.copy,
			["X"] = clipboard_actions.cut,
			["P"] = clipboard_actions.paste,
		},
		float = {
			winblend = 0,
			curdir_window = {
				enable = false,
				highlight_dirname = false,
			},
		},
		hide_cursor = true,
		on_init = function()
			-- use visual mode
			v.api.nvim_buf_set_keymap(
				0,
				"x",
				"J",
				':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
				{ noremap = true, silent = true }
			)
			-- echo cwd
			v.api.nvim_echo({ { v.fn.expand("%:p"), "Normal" } }, false, {})
		end,
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

return M
