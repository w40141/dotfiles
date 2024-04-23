local v = vim

-- TODO: https://github.com/epwalsh/pomo.nvim
-- TODO: https://github.com/tris203/hawtkeys.nvim
-- TODO: https://github.com/yutkat/my-neovim-pluginlist/blob/main/search_replace_grep_select.md#replace
-- TODO: https://zenn.dev/charlie/articles/421bd209099ea5
-- TODO: https://github.com/rgroli/other.nvim
-- TODO: https://github.com/nvim-orgmode/orgmode
-- TODO: https://github.com/nvim-neorg/neorg

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
