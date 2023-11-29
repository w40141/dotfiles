local v = vim
local fn = v.fn
local opt = v.opt

-- TODO: https://github.com/folke/flash.nvim
-- TODO: https://github.com/nvim-pack/nvim-spectre
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not v.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
opt.rtp:prepend(lazypath)

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
