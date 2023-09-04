local conf = require("plugins.lsp.config")
local setup = require("plugins.lsp.setup")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      {
        "williamboman/mason.nvim",
        config = conf.mason,
      },
    },
    init = setup.lspconfig,
    config = conf.lspconfig,
    event = { "BufReadPre", "FocusLost", "CursorHold" },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    config = conf.mason_tool_installer,
  },
}
