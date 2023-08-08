local conf = require("modules.complement.config")
-- local setup = require("modules.complement.setup")

local function i(p)
  p.event = { "InsertEnter" }
  return p
end

local function c(p)
  p.event = { "CmdlineEnter" }
  return p
end

return {
  {
    "hrsh7th/nvim-cmp",
    module = { "cmp" },
    config = conf.cmp,
    requires = {
      { "onsails/lspkind-nvim", module = { "lspkind" } },
      i({ "hrsh7th/cmp-nvim-lsp", module = { "cmp_nvim_lsp" } }),
      i({ "ray-x/lsp_signature.nvim", config = conf.signature }),
      i({ "hrsh7th/cmp-nvim-lsp-document-symbol" }),
      i({ "hrsh7th/cmp-buffer" }),
      i({ "ray-x/cmp-treesitter" }),
      c({ "hrsh7th/cmp-cmdline" }),
      c({ "hrsh7th/cmp-path" }),
      i({
        "saadparwaiz1/cmp_luasnip",
        requires = {
          "L3MON4D3/LuaSnip",
          module = { "luasnip" },
          requires = { "rafamadriz/friendly-snippets" },
          config = conf.luasnip,
        },
      }),
      i({
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      }),
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = conf.copilot,
  },
  {
    "windwp/nvim-autopairs",
    module = { "nvim-autopairs" },
    requires = { "hrsh7th/nvim-cmp" },
    want = { "nvim-cmp" },
    config = conf.autopairs,
  },
}
