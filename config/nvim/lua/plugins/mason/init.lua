local conf = require("plugins.mason.config")

return {
	url = "https://github.com/williamboman/mason.nvim",
	cmd = { "Mason" },
	config = conf.mason,
}
