local v = vim

-- TODO: https://github.com/folke/which-key.nvim
-- Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.

-- TODO: todo.txt
-- https://github.com/arnarg/todotxt.nvim

-- TODO: cursor
-- https://github.com/yetone/avante.nvim

-- TODO: copilot chat
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
-- https://tomato3713.hatenablog.com/entry/2024/05/29/211918
-- https://qiita.com/lx-sasabo/items/97c49d0f354ea3bdd525

-- TODO: convert string case
-- https://github.com/johmsalas/text-case.nvim

local lazypath = v.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (v.uv or v.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	v.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
v.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	-- checker = { enabled = true },
	defaults = {
		lazy = true,
	},
	performance = {
		cache = {
			enabled = true,
			path = v.fn.stdpath("cache") .. "/lazy/cache",
			disable_events = { "UIEnter", "BufReadPre" },
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and the config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to include in the rtp
		},
	},
})
