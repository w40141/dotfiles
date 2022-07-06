local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    })
end

require("packer").startup(function(use)
    -- Package Manager
    -- https://github.com/wbthomason/packer.nvim
    use({ "wbthomason/packer.nvim" })

    -- Library
    -- https://github.com/nvim-lua/plenary.nvim
    use({ "nvim-lua/plenary.nvim" })

    -- Colorscheme
    -- https://github.com/rebelot/kanagawa.nvim
    local colorscheme = "kanagawa.nvim"
    use({
        "rebelot/kanagawa.nvim",
        event = { "VimEnter", "ColorSchemePre" },
        config = function()
            require("rc.kanagawa-nvim")
        end
    })

    -- Fzf finder
    -- https://github.com/nvim-telescope/telescope.nvim
    use({
        "nvim-telescope/telescope.nvim",
        after = colorscheme,
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("rc.telescope-nvim")
        end,
    })
    -- https://github.com/nvim-telescope/telescope-packer.nvim
    use({
        "nvim-telescope/telescope-packer.nvim",
        after = { "telescope.nvim" },
        config = function()
            require("telescope").load_extension("packer")
        end,
    })

    -- Treesitter configurations
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        after = colorscheme,
        run = ":TSUpdate",
        config = function()
            require("rc.treesitter")
        end
    })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } })
    use({ "yioneko/nvim-yati", after = { "nvim-treesitter" } })
    use({ "m-demare/hlargs.nvim", after = { "nvim-treesitter" } })
    use({ "p00f/nvim-ts-rainbow", after = { "nvim-treesitter" } })
    use({ "haringsrob/nvim_context_vt", after = { "nvim-treesitter", colorscheme } })
    use({ "romgrk/nvim-treesitter-context", opt = true, cmd = { "TSContextEnable" } })
    use({
        "lewis6991/spellsitter.nvim",
        after = "nvim-treesitter",
        config = function()
            require("spellsitter").setup()
        end
    })

    -- Icons
    -- https://github.com/kyazdani42/nvim-web-devicons
    use({ "kyazdani42/nvim-web-devicons", after = colorscheme })

    -- Greeter
    -- https://github.com/goolord/alpha-nvim
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        after = colorscheme,
        config = function()
            require("rc.alpha-nvim")
        end
    })

    -- Buffer line
    -- https://github.com/akinsho/bufferline.nvim
    use({
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        after = colorscheme,
        config = function()
            require("rc.bufferline")
        end,
    })

    -- Status line
    -- https://github.com/nvim-lualine/lualine.nvim
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        after = colorscheme,
        config = function()
            require("rc.lualine")
        end,
    })

    -- Code outline
    -- https://github.com/stevearc/aerial.nvim
    use({
        "stevearc/aerial.nvim",
        event = "VimEnter",
        config = function()
            require("rc.aerial")
        end
    })

    -- Indent guide
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "VimEnter",
        config = function()
            require("rc.indent-blankline")
        end
    })

    -- quickly highlight <cword> or visually selected word
    -- https://github.com/t9md/vim-quickhl
    use({
        "t9md/vim-quickhl",
        event = "VimEnter",
        config = function()
            require("rc.vim-quickhl")
        end
    })

    -- Highlight, list and search todo comments
    -- https://github.com/folke/todo-comments.nvim
    use({
        "folke/todo-comments.nvim",
        event = "VimEnter",
        after = colorscheme,
        config = function()
            require("rc.todo-comments")
        end
    })

    -- Scrollbar
    -- https://github.com/petertriho/nvim-scrollbar
    use({
        "petertriho/nvim-scrollbar",
        event = "VimEnter",
        config = function()
            require("scrollbar").setup()
        end
    })

    -- edit
    -- A surround text object plugin for neovim written in lua.
    -- https://github.com/ur4ltz/surround.nvim
    use {
        "ur4ltz/surround.nvim",
        event = { "VimEnter", },
        config = function()
            require("rc.surround")
        end
    }

    -- Autopairs
    -- https://github.com/windwp/nvim-autopairs
    use({
        "windwp/nvim-autopairs",
        event = "VimEnter",
        config = function()
            require("rc.nvim-autopairs")
        end,
    })

    -- Snippet
    -- https://github.com/rafamadriz/friendly-snippets
    use({ "rafamadriz/friendly-snippets", opt = true })
    -- https://github.com/dcampos/nvim-snippy
    use({
        "dcampos/nvim-snippy",
        event = "VimEnter",
        config = function()
            require("rc.nvim-snippy")
        end,
    })

    -- Cmp
    -- https://github.com/hrsh7th/nvim-cmp
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "dcampos/nvim-snippy", opt = true, event = "VimEnter" },
            { "windwp/nvim-autopairs", opt = true, event = "VimEnter" },
        },
        after = { "nvim-snippy", "nvim-autopairs" },
        config = function()
            require("rc.nvim-cmp")
        end,
    })
    -- https://github.com/onsails/lspkind.nvim
    use({
        "onsails/lspkind-nvim",
        module = "lspkind",
        config = function()
            require("rc.lspkind-nvim")
        end,
    })
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    use({ "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" })
    -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
    use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-buffer
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-path
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-omin
    use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-nvim-lua
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-emoji
    use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
    -- https://github.com/f3fora/cmp-spell
    use({ "f3fora/cmp-spell", after = "nvim-cmp" })
    -- https://github.com/yutkat/cmp-mocword
    use({ "yutkat/cmp-mocword", after = "nvim-cmp" })
    -- https://github.com/ray-x/cmp-treesitter
    use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })
    -- https://github.com/hrsh7th/cmp-cmdline
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    -- https://github.com/dcampos/cmp-snippy
    use({ "dcampos/cmp-snippy", after = { "nvim-cmp" } })

    -- LSP
    -- https://github.com/neovim/nvim-lspconfig
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("rc.nvim-lspconfig")
        end
    })
    -- https://github.com/tamago324/nlsp-settings.nvim
    use({
        "tamago324/nlsp-settings.nvim",
        after = { "nvim-lspconfig" },
        config = function()
            require("rc/nlsp-settings")
        end,
    })
    -- https://github.com/williamboman/nvim-lsp-installer
    use({
        "williamboman/nvim-lsp-installer",
        after = { "nvim-lspconfig", "cmp-nvim-lsp", "nlsp-settings.nvim" },
        config = function()
            require("rc.nvim-lsp-installer")
        end
    })

    -- use({
    --     "jose-elias-alvarez/null-ls.nvim",
    --     after = "nvim-lsp-installer",
    --     config = function()
    --         require("rc/null-ls")
    --     end,
    -- })
    -- use({ "vim-denops/denops.vim" })
    -- use({ "vim-skk/skkeleton", requires = { "vim-denops/denops.vim" } })
    -- use({ "rinx/cmp-skkeleton", after = { "nvim-cmp", "skkeleton" } })
    use({
        "tyru/eskk.vim",
        opt = true,
        event = "InsertEnter",
        config = function()
            require("rc.eskk")
        end
    })

    -- Misc
    -- A fancy, configurable, notification manager for NeoVim
    -- https://github.com/rcarriga/nvim-notify
    use({
        "rcarriga/nvim-notify",
        module = "notify"
    })
    -- use({
    --     'yutkat/taskrun.nvim',
    --     after = { "toggleterm.nvim", "nvim-notify" },
    --     config = function()
    --         require("rc/taskrun-nvim")
    --     end,
    -- })

    use({
        "vim-jp/vimdoc-ja",
        opt = true,
        cmd = "help"
    })
    use({
        "airblade/vim-rooter",
        event = "VimEnter",
        setup = function()
            require("rc.vim-rooter")
        end
    })
    use({
        "tweekmonster/startuptime.vim",
        opt = true,
        cmd = "StartupTime"
    })
    use({
        "vim-test/vim-test",
        config = function()
            require("rc.vim-test")
        end
    })
    -- Generating images of source code using
    -- https://github.com/segeljakt/vim-silicon
    use({
        "segeljakt/vim-silicon",
        opt = true,
        cmd = "Silicon"
    })

    use({
        "jsborjesson/vim-uppercase-sql",
        ft = { "sql" }
    })

    -- Highlight length of search result
    -- https://github.com/kevinhwang91/nvim-hlslens
    use({
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("rc.nvim-hlslens")
        end
    })

    -- Delete buffers
    -- https://github.com/famiu/bufdelete.nvim
    use({
        "famiu/bufdelete.nvim",
        event = "VimEnter",
    })

    -- File finder
    -- https://github.com/tamago324/lir.nvim
    use({
        "tamago324/lir.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
        after = { colorscheme, "nvim-web-devicons" },
        config = function()
            require("rc.lir")
        end
    })

    -- Perform the replacement in quickfix
    -- https://github.com/thinca/vim-qfreplace
    use({ "thinca/vim-qfreplace" })

    -- Run commands quickly
    -- https://github.com/thinca/vim-quickrun
    use({ "thinca/vim-quickrun" })

    -- Open URI
    -- https://github.com/tyru/open-browser.vim
    use({
        "tyru/open-browser.vim",
        event = "VimEnter",
        setup = function()
            require("rc.open-browser")
        end
    })

    use({
        "previm/previm",
        ft = { "markdown" },
        setup = function()
            require("rc.previm")
        end
    })

    use({
        "rust-lang/rust.vim",
        ft = { "rust" },
        setup = function()
            require("rc.rust")
        end
    })

    -- Resizing of windows
    -- https://github.com/simeji/winresizer
    use({
        "simeji/winresizer",
        event = "VimEnter",
        setup = function()
            require("rc.winresizer")
        end
    })

    -- Comment out
    -- https://github.com/numToStr/Comment.nvim
    use({
        "numToStr/Comment.nvim",
        event = "VimEnter",
        config = function()
            require("Comment").setup()
        end
    })

    -- Underlines the word under the cursor
    -- https://github.com/itchyny/vim-cursorword
    use({
        "itchyny/vim-cursorword",
        event = "VimEnter",
    })

    -- Terminal
    -- https://github.com/akinsho/toggleterm.nvim
    use({
        "akinsho/toggleterm.nvim",
        event = "VimEnter",
        config = function()
            require("rc.toggleterm")
        end,
    })

    use({ "kamykn/spelunker.vim" })
    use({ "lambdalisue/gina.vim" })
    use({
        "skanehira/translate.vim",
        event = "VimEnter",
        config = function()
            require("rc.translate")
        end
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        event = "VimEnter",
        config = function()
            require("rc.gitsigns")
        end,
    })

    -- Colorizer
    -- https://github.com/norcalli/nvim-colorizer.lua
    use({
        "norcalli/nvim-colorizer.lua",
        event = "VimEnter",
        config = function()
            require("rc.nvim-colorizer")
        end
    })

    -- Whitespace highlighting
    -- https://github.com/ntpeters/vim-better-whitespace
    use({
        "ntpeters/vim-better-whitespace",
        opt = true,
        cmd = { "StripWhitespace" },
        config = function()
            require("rc.vim-better-whitespace")
        end
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)

cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugin.lua source <afile> | PackerCompile
    augroup end
]])
