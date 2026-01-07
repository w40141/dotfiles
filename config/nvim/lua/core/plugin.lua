local v = vim

-- TODO: todo.txt
-- https://github.com/arnarg/todotxt.nvim
-- TODO: edit window
-- https://github.com/anuvyklack/windows.nvim
-- TODO: key menu
-- https://github.com/emmanueltouzery/key-menu.nvim
-- TODO:
-- https://zenn.dev/vim_jp/articles/e2620b502913f4
-- TODO: restart
-- https://zenn.dev/vim_jp/articles/2308d5e7db8bc7
-- TODO: quit
-- https://zenn.dev/vim_jp/articles/ff6cd224fab0c7
-- TODO: yank
-- https://satorunooshie.medium.com/register-is-more-than-clipboard-a1b9e269ca59

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
