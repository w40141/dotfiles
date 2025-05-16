local opts = require("plugins.ai.opts")

-- TODO: cursor
-- https://github.com/yetone/avante.nvim

return {
	{
		"zbirenbaum/copilot.lua",
		-- url = "https://github.com/zbirenbaum/copilot.lua",
		build = ":Copilot auth",
		cmd = "Copilot",
		event = { "InsertEnter" },
		opts = opts.copilot,
	},
	{
		-- TODO: copilot chat
		-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
		-- https://tomato3713.hatenablog.com/entry/2024/05/29/211918
		-- https://qiita.com/lx-sasabo/items/97c49d0f354ea3bdd525
		"CopilotC-Nvim/CopilotChat.nvim",
		-- url = "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatToggle",
			"CopilotChatAgents",
			"CopilotChatModels",
			"CopilotChatPrompts",
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
	},
}
