local global = require("core.global")
local vim = vim
local g = vim.g

local disable_distribution_plugins = function()
	-- disable menu loading
	g.did_install_default_menus = 1
	g.did_install_syntax_menu = 1

	-- Do not load native syntax completion
	g.loaded_syntax_completion = 1

	-- Do not load spell files
	g.loaded_spellfile_plugin = 1

	-- Whether to load netrw by default
	g.loaded_netrw = 1
	g.loaded_netrwFileHandlers = 1
	g.loaded_netrwPlugin = 1
	g.loaded_netrwSettings = 1
	-- newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
	g.netrw_liststyle = 3

	-- Do not load tohtml.vim
	g.loaded_2html_plugin = 1

	-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
	-- related to checking files inside compressed files)
	g.loaded_gzip = 1
	g.loaded_tar = 1
	g.loaded_tarPlugin = 1
	g.loaded_vimball = 1
	g.loaded_vimballPlugin = 1
	g.loaded_zip = 1
	g.loaded_zipPlugin = 1

	-- Do not use builtin matchit.vim and matchparen.vim since the use of vim-matchup
	g.loaded_matchit = 1
	g.loaded_matchparen = 1

	-- Disable sql omni completion.
	g.loaded_sql_completion = 1

	g.loaded_remote_plugins = 1
end

local clipboard_config = function()
	if global.is_mac then
		g.clipboard = {
			name = "macOS-clipboard",
			copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
			paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
			cache_enabled = 0,
		}
	elseif global.is_wsl then
		g.clipboard = {
			name = "win32yank-wsl",
			copy = {
				["+"] = "win32yank.exe -i --crlf",
				["*"] = "win32yank.exe -i --crlf",
			},
			paste = {
				["+"] = "win32yank.exe -o --lf",
				["*"] = "win32yank.exe -o --lf",
			},
			cache_enabled = 0,
		}
	end
end

local load_core = function()
	local pack = require("core.pack")
	disable_distribution_plugins()

	pack.ensure_plugins()
	clipboard_config()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.event")
	pack.load_compile()

	-- vim.api.nvim_command([[set background=light]])
	vim.api.nvim_command([[colorscheme kanagawa]])
end

load_core()
