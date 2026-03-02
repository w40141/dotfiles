local keys = require("plugins.buffer.keys")

return {
	{
		-- Delete multiple vim buffers based on different conditions
		"kazhala/close-buffers.nvim",
		-- url = "https://github.com/kazhala/close-buffers.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		keys = keys.close,
	},
}
