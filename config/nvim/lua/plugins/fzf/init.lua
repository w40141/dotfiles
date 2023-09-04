local conf = require("plugins.fzf.config")
local setup = require("plugins.fzf.setup")

return {
  {
    -- Fzf finder
    "nvim-telescope/telescope.nvim",
    cmd = {
      "Telescope",
    },
    dependencies = {
      {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = setup.trouble,
        config = conf.trouble,
      },
      { "stevearc/aerial.nvim" },
    },
    init = setup.telescope,
    config = conf.telescope,
  },
  {
    -- Highlight, list and search todo comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "FocusLost", "CursorHold" },
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
    init = setup.todo_comments,
    config = conf.todo_comments,
  },
}
