local conf = require("modules.fzf.config")
local setup = require("modules.fzf.setup")

return {
  {
    -- Fzf finder
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    module = { "telescope" },
    requires = {
      {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        module = { "trouble" },
        requires = { "kyazdani42/nvim-web-devicons" },
        setup = setup.trouble,
        config = conf.trouble,
      },
      { "stevearc/aerial.nvim", module = { "aerial" } },
    },
    wants = { "trouble.nvim", "aerial.nvim" },
    setup = setup.telescope,
    config = conf.telescope,
  },
  {
    -- Highlight, list and search todo comments
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "FocusLost", "CursorHold" },
    cmd = {
      "TodoQuickFix",
      "TodoLocList",
      "TodoTrouble",
      "TodoTelescope",
    },
    setup = setup.todo_comments,
    config = conf.todo_comments,
  },
}
