local v = vim

-- TODO: https://github.com/chrisgrieser/nvim-spider
-- Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.

-- TODO: https://github.com/epwalsh/pomo.nvim
-- A simple, customizable pomodoro timer for Neovim, written in Lua,
-- with nvim-notify, lualine, and telescope integrations

-- TODO: https://github.com/tris203/hawtkeys.nvim
--  Suggest new easy to hit keymaps and find issues with your current key map configurations

-- TODO: https://github.com/rgroli/other.nvim
-- Open alternative files for the current buffer

-- TODO: https://github.com/nvim-orgmode/orgmode
-- Orgmode clone written in Lua for Neovim 0.9+.

local lazypath = v.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not v.loop.fs_stat(lazypath) then
	v.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
v.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
}

require("lazy").setup("plugins", opts)
