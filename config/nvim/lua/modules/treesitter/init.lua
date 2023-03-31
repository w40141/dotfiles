local conf = require("modules.treesitter.config")

local function e(p)
  p.event = { "BufRead", "BufNewFile" }
  p.wants = { "nvim-treesitter" }
  return p
end

return {
  {
    -- Treesitter configurations
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufNewFile", "BufRead" },
    config = conf.treesitter,
  },
  e({ "nvim-treesitter/nvim-treesitter-textobjects" }),
  e({ "yioneko/nvim-yati" }),
  e({ "m-demare/hlargs.nvim" }),
  -- e({"mrjones2014/nvim-ts-rainbow"}),
  -- e({ "p00f/nvim-ts-rainbow" }),
  e({
    "haringsrob/nvim_context_vt",
    config = conf.context_vt,
  }),
}
