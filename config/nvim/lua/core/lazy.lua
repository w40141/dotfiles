local gl = require("core.global")
local g = gl.g
local v = gl.v
local fn = gl.fn
local opt = gl.opt

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not v.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
  "ellisonleao/gruvbox.nvim",
  "tpope/vim-commentary",       -- コメントアウト
  "kana/vim-textobj-user",      -- text-objectのユーザーカスタマイズ
  -- 'kana/vim-textobj-entire', -- 全体が範囲のtext-object / エラーになる
  "kshenoy/vim-signature",      -- マークの可視化
  "nvim-tree/nvim-web-devicons", -- アイコンの表示
  -- ブラックホールレジスト+putの省略
  {
    "vim-scripts/ReplaceWithRegister",
    keys = {
      { "_", "<Plug>ReplaceWithRegisterOperator" },
    },
  },
  -- バッファ・タブバーをかっこよく
  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-web-devicons" },
    event = { "BufNewFile", "BufRead" },
  },
  -- 囲まれているものの操作
  {
    "machakann/vim-sandwich",
    config = function()
      v.cmd("runtime macros/sandwich/keymap/surround.vim")
    end,
  },
  -- キャメルケースモーション
  {
    "bkad/CamelCaseMotion",
    config = function()
      v.g.camelcasemotion_key = "]"
    end,
  },
  -- 画面内瞬間移動
  {
    "phaazon/hop.nvim",
    keys = {
      { "s", ":HopChar2MW<CR>" },
    },
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  -- yankハイライト
  {
    "machakann/vim-highlightedyank",
    config = function()
      v.g.highlightedyank_highlight_duration = 300
    end,
  },
  -- マルチカーソル
  {
    "mg979/vim-visual-multi",
    init = function()
      local t = {}
      t["Find Under"] = "<C-k>"
      g.VM_maps = t
    end,
  },
  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-web-devicons", opt = true },
    event = { "BufNewFile", "BufRead" },
    options = { theme = "gruvbox" },
    config = 'require("lualine").setup()',
  },
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-frecency.nvim", "kkharji/sqlite.lua" },
    keys = {
      { "<C-j>f", ":Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>" },
      { "<C-j>e", ":Telescope frecency<CR>" },
      { "<C-j>g", ":Telescope live_grep<CR>" },
      { "<C-j>l", ":Telescope current_buffer_fuzzy_find<CR>" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<F12>"] = actions.select_vertical,
            },
            n = { ["q"] = actions.close },
          },
          layout_strategy = "vertical",
        },
        extensions = {
          frecency = {
            show_scores = true,
          },
        },
      })
      require("telescope").load_extension("frecency")

      local home = os.getenv("USERPROFILE")
      g.sqlite_clib_path = home .. "/lib/sqlite3.dll"
    end,
  },
  -- エクスプローラー
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<M-w>",  ":NvimTreeToggle<CR>" },
      { "<C-j>w", ":NvimTreeFindFile<CR>" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  -- Gitの行表示
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufNewFile", "BufRead" },
    keys = {
      { "<C-j>d",     ":Gitsigns preview_hunk<CR>" },
      { "<C-j>D",     ":Gitsigns diffthis<CR>" },
      { "<C-j><C-u>", ":Gitsigns reset_hunk<CR>" },
      { "<Space>s",   ":Gitsigns stage_hunk<CR>" },
      { "<Space>j",   ":Gitsigns next_hunk<CR>" },
      { "<Space>k",   ":Gitsigns prev_hunk<CR>" },
    },
    config = function()
      require("gitsigns").setup()
    end,
  },
  -- VSCode like
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "InsertEnter",
    keys = {
      -- 定義に移動
      { "<C-]>",  "<Plug>(coc-definition)" },
      -- 呼び出し元に移動
      { "<C-j>h", "<Plug>(coc-references)" },
      -- 実装に移動
      { "<C-j>i", "<Plug>(coc-implementation)" },
      -- 配下の定義を表示
      { "<M-s>",  ":call CocActionAsync('doHover')<CR>" },
      { "<C-P>",  "<C-\\><C-O>:call CocActionAsync('showSignatureHelp')<CR>", mode = "i" },
      -- 前後のエラーや警告に移動
      { "<M-k>",  "<Plug>(coc-diagnostic-prev)" },
      { "<M-j>",  "<Plug>(coc-diagnostic-next)" },
      -- Enterキーで決定
      {
        "<cr>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        mode = "i",
        expr = true,
        replace_keycodes = false,
      },
      -- code action
      { "<M-CR>",  "<Plug>(coc-codeaction-cursor)" },
      -- Find symbol of current document
      { "<C-j>o",  ":<C-u>CocList outline<cr>" },
      -- Search workspace symbols
      { "<C-j>s",  ":<C-u>CocList -I symbols<cr>" },
      -- Rename
      { "<S-M-r>", "<Plug>(coc-rename)" },
      -- Auto complete
      { "<F5>",    "coc#refresh()" },
    },
    config = function()
      g.coc_global_extensions = {
        "coc-json",
        "coc-tsserver",
        "coc-css",
        "coc-yaml",
        "coc-rust-analyzer",
        "coc-sh",
        "coc-prettier",
        "coc-pyright",
        "@yaegassy/coc-volar",
      }
    end,
  },
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<M-p>", ":MarkdownPreviewToggle<CR>" },
    },
    build = function()
      fn["mkdp#util#install"]()
    end,
  },
})
