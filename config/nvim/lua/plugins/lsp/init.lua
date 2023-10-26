local conf = require("plugins.lsp.config")
local setup = require("plugins.lsp.setup")

return {
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    init = setup.lspconfig,
    config = conf.lspconfig,
    event = { "BufReadPre", "FocusLost", "CursorHold" },
  },
}
