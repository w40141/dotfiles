local conf = require("plugins.linter.config")

return {
	{
		"mfussenegger/nvim-lint",
		-- url = "https://github.com/mfussenegger/nvim-lint",
		event = { "FocusLost", "CursorHold" },
		config = conf.lint,
	},
	{
		-- "rshkarin/mason-nvim-lint",
    -- "mimikun/mason-nvim-lint",
		-- url = "https://github.com/rshkarin/mason-nvim-lint",
    -- url = "https://github.com/mimikun/mason-nvim-lint"
	},
}
