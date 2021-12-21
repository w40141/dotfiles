" Nvim Treesitter configurations and abstraction layer
" https://github.com/nvim-treesitter/nvim-treesitter
" https://github.com/nvim-treesitter/nvim-treesitter-textobjects

UsePlugin 'nvim-treesitter'

lua << EOF
require('nvim-treesitter.configs').setup{
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { 'vim' },
  },
  indent = { enable = true },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true,
  --     keymaps = {
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["ac"] = "@conditional.outer",
  --       ["ic"] = "@conditional.inner",
  --       ["ab"] = "@block.outer",
  --       ["ib"] = "@block.inner",
  --     },
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = {
  --       ["<leader>a"] = "@parameter.inner",
  --     },
  --     swap_previous = {
  --       ["<leader>A"] = "@parameter.inner",
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       ["]f"] = "@function.outer",
  --       ["]c"] = "@conditional.outer",
  --     },
  --     goto_next_end = {
  --       ["]F"] = "@function.outer",
  --       ["]C"] = "@conditional.outer",
  --     },
  --     goto_previous_start = {
  --       ["[f"] = "@function.outer",
  --       ["[c"] = "@conditional.outer",
  --     },
  --     goto_previous_end = {
  --       ["[F"] = "@function.outer",
  --       ["[C"] = "@conditional.outer",
  --     },
  --   },
  -- },
}
EOF
