local setup = require("modules.edit.setup")
local conf = require("modules.edit.config")

local function e(p)
  p.event = { -- "InsertEnter",
    -- "CursorHold",
    -- "FocusLost",
    -- "BufRead",
    -- "BufNewFile",
    "BufReadPre",
  }
  return p
end

local function i(p)
  p.event = { "InsertEnter" }
  return p
end

return {
  {
    -- Annotation generator
    "danymat/neogen",
    requires = { "nvim-treesitter/nvim-treesitter" },
    module = { "neogen" },
    wants = { "nvim-treesitter" },
    setup = setup.neogen,
    config = conf.neogen,
  },
  e({
    -- A surround text object plugin for neovim written in lua.
    "ur4ltz/surround.nvim",
    config = conf.surround,
  }),
  i({
    -- engine SKK
    "tyru/eskk.vim",
    keys = {
      { "i", "<Plug>(eskk:toggle)" },
      { "c", "<Plug>(eskk:toggle)" },
    },
    setup = setup.eskk,
    config = conf.eskk,
  }),
  e({
    -- Comment out
    "numToStr/Comment.nvim",
    config = conf.comment,
  }),
  {
    -- Colorizer
    "norcalli/nvim-colorizer.lua",
    cmd = { "ColorizerToggle" },
    config = conf.colorizer,
  },
  {
    -- Use Neovim as a language server to inject LSP diagnostics, code actions
    "jose-elias-alvarez/null-ls.nvim",
    event = { "FocusLost", "CursorHold" },
    requires = "nvim-lua/plenary.nvim",
    config = conf.null_ls,
  },
  {
    "gbprod/yanky.nvim",
    requires = { "stevearc/dressing.nvim", opt = true },
    wants = { "dressing.nvim" },
    keys = {
      { "n", "<Plug>(YankyCycleBackward)" },
      { "n", "<Plug>(YankyCycleForward)" },
      { "n", "<Plug>(YankyGPutAfter)" },
      { "n", "<Plug>(YankyGPutBefore)" },
      { "n", "<Plug>(YankyPutAfter)" },
      { "n", "<Plug>(YankyPutBefore)" },
      { "x", "<Plug>(YankyGPutAfter)" },
      { "x", "<Plug>(YankyGPutBefore)" },
      { "x", "<Plug>(YankyPutAfter)" },
      { "x", "<Plug>(YankyPutBefore)" },
    },
    cmd = { "YankyRingHistory" },
    module = { "yanky" },
    setup = setup.yanky,
    config = conf.yanky,
  },
}
