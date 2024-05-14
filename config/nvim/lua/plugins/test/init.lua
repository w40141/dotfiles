local conf = require("plugins.test.config")
local setup = require("plugins.test.setup")

-- TODO: https://github.com/andythigpen/nvim-coverage
-- TODO: https://github.com/nvim-neotest/neotest
return {
	-- {
	-- 	url = "https://github.com/nvim-neotest/neotest",
	-- 	description = {
	-- 		{ url = "https://github.com/nvim-lua/plenary.nvim" },
	-- 		{ url = "https://github.com/nvim-neotest/neotest-go" },
	-- 		{ url = "https://github.com/nvim-neotest/neotest-python" },
	-- 	},
	-- 	config = conf.neotest,
	-- 	setup = setup.neotest,
	-- 	lazy = true,
	-- },
	{
		"klen/nvim-test",
		-- url = "https://github.com/klen/nvim-test",
		cmd = {
			"TestSuite",
			"TestFile",
			"TestEdit",
			"TestNearest",
			"TestLast",
			"TestVisit",
			"TestInfo",
		},
		config = conf.test,
		init = setup.test,
	},
}
