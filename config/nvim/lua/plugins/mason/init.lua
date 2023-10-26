local conf = require("plugins.mason.config")

return {
  {
    "williamboman/mason.nvim",
    config = conf.mason,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    config = conf.mason_tool_installer,
  },
}
