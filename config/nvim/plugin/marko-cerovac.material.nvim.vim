" Material colorscheme for NeoVim written in Lua with built-in support for native LSP,
" TreeSitter and many more plugins
" https://github.com/marko-cerovac/material.nvim

UsePlugin 'material.nvim'

lua << EOF
require('material').setup({

    -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	contrast = true,
    -- Enable borders between verticaly split windows
	borders = false,
    -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
	popup_menu = "dark",
	italics = {
		comments = false, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},
    -- Specify which windows get the contrasted (darker) background
	contrast_windows = {
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf" -- Darker qf list background
	},
	text_contrast = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},
	disable = {
        -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		background = false,
        -- Prevent the theme from setting terminal colors
		term_colors = false,
        -- Hide the end-of-buffer lines
		eob_lines = false
	},

    -- Overwrite highlights with your own
	custom_highlights = {}
})

if vim.fn.has("termguicolors") == true then
    vim.opt.termguicolors = true
end
vim.cmd("syntax enable")
vim.opt.background = "dark"
vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")
EOF
