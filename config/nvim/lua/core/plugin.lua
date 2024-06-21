local v = vim

-- TODO: https://github.com/epwalsh/pomo.nvim
-- A simple, customizable pomodoro timer for Neovim, written in Lua,
-- with nvim-notify, lualine, and telescope integrations

-- TODO: https://github.com/tris203/hawtkeys.nvim
--  Suggest new easy to hit keymaps and find issues with your current key map configurations

-- TODO: https://github.com/folke/which-key.nvim
-- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.

-- TODO: https://github.com/tani/dmacro.nvim
-- neovim version of dmacro.el, which makes a key macro on-the-fly.

-- TODO: https://github.com/zk-org/zk-nvim
-- Neovim extension for zk

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
			path = v.fn.stdpath("cache") .. "/lazy/cache",
			-- Once one of the following events triggers, caching will be disabled.
			-- To cache all modules, set this to `{}`, but that is not recommended.
			disable_events = { "UIEnter", "BufReadPre" },
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and the config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to include in the rtp
		},
	},
}

require("lazy").setup("plugins", opts)
