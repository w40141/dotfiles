local conf = require("modules.ui.config")
local setup = require("modules.ui.setup")

-- TODO: https://github.com/utilyre/barbecue.nvim
return {
  {
    "rebelot/kanagawa.nvim",
    event = { "VimEnter" },
    config = conf.kanagawa,
  },
  {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    wants = { "nvim-web-devicons" },
    event = "BufWinEnter",
    config = conf.alpha,
  },
  {
    "stevearc/aerial.nvim",
    module = { "aerial" },
    cmd = { "Aerial" },
    setup = setup.aerial,
    config = conf.aerial,
  },
  {
    -- Buffer line
    "akinsho/bufferline.nvim",
    event = { "BufReadPre" },
    requires = {
      { "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
    },
    wants = { "nvim-web-devicons" },
    setup = setup.bufferline,
    config = conf.bufferline,
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPre" },
    requires = {
      { "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
      { "rebelot/kanagawa.nvim" },
      { "stevearc/aerial.nvim",         module = { "aerial" } },
    },
    wants = { "nvim-web-devicons", "kanagawa.nvim", "aerial.nvim" },
    setup = setup.lualine,
    config = conf.lualine,
  },
  {
    -- Indent guide
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost" },
    config = conf.indent_blankline,
  },
  {
    -- A fancy, configurable, notification manager for NeoVim
    "folke/noice.nvim",
    event = {
      "BufRead",
      "BufNewFile",
      "InsertEnter",
      "CmdlineEnter",
      "CursorHold",
      "FocusLost",
    },
    module = { "noice" },
    requires = {
      { "MunifTanjim/nui.nvim" },
      {
        "rcarriga/nvim-notify",
        module = { "notify" },
        config = conf.notify,
      },
    },
    setup = setup.noice,
    config = conf.noice,
  },
  {
    -- Scrollbar
    "petertriho/nvim-scrollbar",
    event = {
      "BufRead",
      "BufNewFile",
      "InsertEnter",
      "CmdlineEnter",
      "CursorHold",
      "FocusLost",
    },
    config = conf.scrollbar,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost" },
    config = conf.gitsigns,
  },
  {
    -- File finder
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    setup = setup.nvimTree,
    config = conf.nvimTree,
  },
}
