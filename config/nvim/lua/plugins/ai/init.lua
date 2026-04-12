local opts = require("plugins.ai.opts")

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
		"yetone/avante.nvim",
		-- url = "https://github.com/yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		opts = opts.avante,
		build = "make",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-telescope/telescope.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
		},
	},
}
