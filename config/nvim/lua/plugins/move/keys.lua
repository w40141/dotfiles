local M = {}

M.spider = {
  {
    "w",
    function()
      return require("spider").motion("w")
    end,
    { desc = "[spider] 次の単語に移動 (w)" },
  },
  {
    "e",
    function()
      return require("spider").motion("e")
    end,
    { desc = "[spider] 次の単語の末尾に移動 (e)" },
  },
  {
    "b",
    function()
      return require("spider").motion("b")
    end,
    { desc = "[spider] 前の単語に移動 (b)" },
  },
}

M.flash = {
  {
    "<C-s>",
    function()
      return require("flash").jump()
    end,
    { desc = "[flash] 文字ジャンプ (Flash)" },
  },
  {
    "S",
    function()
      return require("flash").treesitter()
    end,
    { desc = "[flash] Treesitter でジャンプ" },
  },
  {
    "r",
    function()
      return require("flash").remote()
    end,
    { desc = "[flash] リモートジャンプ (Remote Flash)" },
  },
  {
    "R",
    function()
      return require("flash").treesitter_search()
    end,
    { desc = "[flash] Treesitter 検索" },
  },
}

return M
