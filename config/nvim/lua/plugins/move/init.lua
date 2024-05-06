local setup = require("plugins.move.setup")
local conf = require("plugins.move.config")

return {
	{
		-- Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.
		"chrisgrieser/nvim-spider",
		-- url = "https://github.com/chrisgrieser/nvim-spider"
		lazy = true,
		init = setup.spider,
	},
	{
		-- simply window selector for neovim written in lua
		"tkmpypy/chowcho.nvim",
		-- url = "https://github.com/tkmpypy/chowcho.nvim"
		config = conf.chowcho,
		cmd = { "Chowcho" },
		keys = { "<C-w><C-w>", mode = "n" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<C-s>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
