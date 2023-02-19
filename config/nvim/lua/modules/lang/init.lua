local conf = require("modules.lang.config")

return {
  {
    -- Automatically uppercase SQL keywords
    "jsborjesson/vim-uppercase-sql",
    ft = { "sql" },
  },
  {
    "previm/previm",
    ft = { "markdown" },
    config = conf.previm,
  },
  {
    -- TODO: https://github.com/kevinhwang91/nvim-bqf
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
  {
    "simrat39/rust-tools.nvim",
    -- "kdarkhan/rust-tools.nvim",
    ft = "rust",
    -- modules = "rust-tools",
    requires = { "nvim-lua/plenary.nvim" },
    config = conf.rust,
  },
}
