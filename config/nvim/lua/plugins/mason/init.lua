local conf = require("plugins.mason.config")

return {
	"williamboman/mason.nvim",
	cmd = { "Mason" },
	config = conf.mason,
}
