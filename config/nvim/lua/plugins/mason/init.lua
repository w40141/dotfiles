local conf = require("plugins.mason.config")

return {
	"williamboman/mason.nvim",
	-- url = "https://github.com/williamboman/mason.nvim",
	cmd = { "Mason" },
	config = conf.mason,
}
