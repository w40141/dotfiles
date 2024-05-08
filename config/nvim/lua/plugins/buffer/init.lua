local setup = require("plugins.buffer.setup")

return {
	{
		-- Delete buffers
		"famiu/bufdelete.nvim",
		-- url = "https://github.com/famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		event = "CmdlineEnter",
	},
	{
		-- Delete multiple vim buffers based on different conditions
		'kazhala/close-buffers.nvim',
		-- url = "https://github.com/kazhala/close-buffers.nvim",
		init = setup.close,
		event = { "VeryLazy" },
	},
}
