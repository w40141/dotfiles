local conf = require("plugins.test.config")
local setup = require("plugins.test.setup")

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
		url = "https://github.com/klen/nvim-test",
		cmd = {
			"TestSuite",
			"TestFile",
			"TestEdit",
			"TestNearest",
			"TestLast",
			"TestVisit",
			"TestInfo",
		},
		config = conf.nvim_test,
		setup = setup.nvim_test,
	},
}
