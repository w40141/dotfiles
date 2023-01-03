return {
	{
		-- https://github.com/simrat39/rust-tools.nvim
		"simrat39/rust-tools.nvim",
		module = { "rust-tools" },
		requires = { "nvim-lua/plenary.nvim" },
		-- config = require("rc.config.rust-tools")
	},
	{
		-- https://github.com/TimUntersberger/neogit
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		wants = "plenary.nvim",
		cmd = { "Neogit" },
		config = function()
			require("neogit").setup({})
		end,
	},
	{
		-- Delete buffers
		-- https://github.com/famiu/bufdelete.nvim
		"famiu/bufdelete.nvim",
		event = "CmdlineEnter",
	},
	{
		-- Terminal
		-- https://github.com/akinsho/toggleterm.nvim
		"akinsho/toggleterm.nvim",
		keys = { "n", [[<c-;>]] },
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = require("rc.config.toggleterm-nvim"),
	},
	{
		-- Resizing of windows
		-- https://github.com/simeji/winresizer
		"simeji/winresizer",
		keys = { { "n", "<C-e>" } },
		setup = require("rc.config.winresizer"),
	},
}
