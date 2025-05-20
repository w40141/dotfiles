local keys = require("plugins.hover.keys")

return {
	{
		"lewis6991/hover.nvim",
		-- url = "https://github.com/lewis6991/hover.nvim",
		opts = {
			init = function()
				-- Require providers
				require("hover.providers.lsp")
				-- require('hover.providers.gh')
				-- require('hover.providers.gh_user')
				-- require('hover.providers.jira')
				-- require('hover.providers.man')
				require("hover.providers.dictionary")
			end,
			preview_opts = {
				border = "single",
			},
			-- to a :h preview-window when pressing the hover keymap.
			preview_window = false,
			title = true,
			mouse_providers = {
				"LSP",
			},
			mouse_delay = 1000,
		},
		keys = keys.hover,
	},
}
