local v = vim
local key = v.keymap.set
local opt = v.opt
local fn = v.fn

opt.termguicolors = true
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

local opts = { noremap = true, silent = true }
key("n", "[b", "<Cmd>BufferLineCyclePrev<cr>", opts)
key("n", "]b", "<Cmd>BufferLineCycleNext<cr>", opts)

-- These commands will sort buffers by directory, language, or a custom criteria
key("n", "bE", "<Cmd>BufferLineSortByExtension<cr>", opts)
key("n", "bD", "<Cmd>BufferLineSortByDirectory<cr>", opts)
key("n", "bg", "<Cmd>BufferLinePick<cr>", opts)

-- These commands will move the current buffer backwards or forwards in the bufferline
key("n", "<silent><leader>1", "<Cmd>BufferLineGoToBuffer 1<cr>", opts)
key("n", "<silent><leader>2", "<Cmd>BufferLineGoToBuffer 2<cr>", opts)
key("n", "<silent><leader>3", "<Cmd>BufferLineGoToBuffer 3<cr>", opts)
key("n", "<silent><leader>4", "<Cmd>BufferLineGoToBuffer 4<cr>", opts)
key("n", "<silent><leader>5", "<Cmd>BufferLineGoToBuffer 5<cr>", opts)
key("n", "<silent><leader>6", "<Cmd>BufferLineGoToBuffer 6<cr>", opts)
key("n", "<silent><leader>7", "<Cmd>BufferLineGoToBuffer 7<cr>", opts)
key("n", "<silent><leader>8", "<Cmd>BufferLineGoToBuffer 8<cr>", opts)
key("n", "<silent><leader>9", "<Cmd>BufferLineGoToBuffer 9<cr>", opts)
