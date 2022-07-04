local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use({ "nvim-lua/popup.nvim", module = "popup" })
    use({ "nvim-lua/plenary.nvim" }) -- do not lazy load
    use({ "tami5/sqlite.lua", module = "sqlite" })
    use({ "MunifTanjim/nui.nvim", module = "nui" })
    use({ "honza/vim-snippets" })
    use({
        "windwp/nvim-autopairs",
        event = "VimEnter",
        config = function()
            require("rc/nvim-autopairs")
        end,
    })
    use({
        "dcampos/nvim-snippy",
        event = "VimEnter",
        config = function()
            require("rc/nvim-snippy")
        end,
    })
    use({
        "dcampos/cmp-snippy",
        event = "VimEnter",
    })
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("rc/nvim-cmp")
        end,
    })
    use({
        "onsails/lspkind-nvim",
        module = "lspkind",
        config = function()
            require("rc/lspkind-nvim")
        end,
    })
    use({ "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
    use({ "f3fora/cmp-spell", after = "nvim-cmp" })
    use({ "yutkat/cmp-mocword", after = "nvim-cmp" })
    use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("rc/nvim-lspconfig")
        end
    })
    use({
        "williamboman/nvim-lsp-installer",
        config = function()
            require("rc/nvim-lsp-installer")
        end
    })
    -- Misc
    use({
        "rcarriga/nvim-notify",
        module = "notify"
    })
    use({
        "airblade/vim-rooter",
        event = "VimEnter",
        setup = function()
            require("rc.vim-rooter")
        end
    })
    use({
        'vim-jp/vimdoc-ja',
        opt = true,
        cmd = "help"
    })
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function ()
            require("rc.alpha-nvim")
        end
    })
    -- edit
    use({
        "echasnovski/mini.nvim",
        event = "InsertEnter",
        config = function()
            require("rc.mini")
        end
    })
    use({
        "jsborjesson/vim-uppercase-sql",
        ft = {"sql"}
    })
    use({
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("rc.nvim-hlslens")
        end
    })
    use({
        "tweekmonster/startuptime.vim",
        opt = true,
        cmd = "StartupTime"
    })
    use({
        "famiu/bufdelete.nvim",
        event = "VimEnter",
    })
    use({
        'vim-test/vim-test',
        config = function()
            require("rc.vim-test")
        end
    })
    -- filer
    use({
        "tamago324/lir.nvim",
        config = function()
            require("rc.lir")
        end
    })
    use({
        "terryma/vim-expand-region",
        event = "VimEnter",
        setup = function()
            require("rc.vim-expand-region")
        end
    })
    use({'thinca/vim-qfreplace'})
    use({'thinca/vim-quickrun'})
    use({
        'tyru/eskk.vim',
        opt = true,
        event = "InsertEnter",
        config = function()
            require("rc.eskk")
        end
    })
    use({
        'tyru/open-browser.vim',
        event = "VimEnter",
        setup = function()
            require("rc.open-browser")
        end
    })
    use({
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end
    })
    use({
        "previm/previm",
        ft = {"markdown"},
        setup = function()
            require("rc.previm")
        end
    })
    local colorscheme = kanagawa
    use({
        "rebelot/kanagawa.nvim",
        config = function()
            require("rc.kanagawa-nvim")
        end
    })
    use({
        "rust-lang/rust.vim",
        ft = {"rust"},
        setup = function()
            require("rc.rust")
        end
    })
    use({
        "segeljakt/vim-silicon",
        opt = true,
        cmd = "Silicon"
    })
    use({
        "simeji/winresizer",
        event = "VimEnter",
        setup = function()
            require("rc.winresizer")
        end
    })
    use({
        "numToStr/Comment.nvim",
        event = "VimEnter",
        config = function()
            require('Comment').setup()
        end
    })
    use({
        't9md/vim-quickhl',
        config = function()
            require('rc.vim-quickhl')
        end
    })
    use({
        'folke/todo-comments.nvim',
        event = "VimEnter",
        config = function()
            require('rc.todo-comments')
        end
    })
    use({
        'itchyny/vim-cursorword',
        event = "VimEnter",
    })
    use({
        'akinsho/bufferline.nvim',
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        after = colorscheme,
        config = function()
            require("rc/bufferline")
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        after = colorscheme,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("rc/lualine")
        end,
    })
    use({
        'lukas-reineke/indent-blankline.nvim',
        event = "VimEnter",
        config = function()
            require("rc/indent-blankline")
        end
    })
    use({
        "akinsho/toggleterm.nvim",
        event = "VimEnter",
        config = function()
            require("rc/toggleterm")
        end,
    })
    use({
        'nvim-treesitter/nvim-treesitter',
        after = colorscheme,
        run = ":TSUpdate",
        config = function()
            require("rc/treesitter")
        end
    })
    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = {"nvim-treesitter"}
    })
    use({
        "yioneko/nvim-yati",
        after = {"nvim-treesitter"}
    })
    use({
        'm-demare/hlargs.nvim',
        after = { 'nvim-treesitter' }
    })
    use({
        "p00f/nvim-ts-rainbow",
        after = { "nvim-treesitter" }
    })
    use({
        "haringsrob/nvim_context_vt",
        after = { "nvim-treesitter", colorscheme }
    })
    use({
        "romgrk/nvim-treesitter-context",
        cmd = { "TSContextEnable" },
    })
    -- use({
    --   'stevearc/aerial.nvim',
    --   config = function() require('aerial').setup() end
    -- })
    use({'kamykn/spelunker.vim'})
    use({'lambdalisue/gina.vim'})
    use({
        'skanehira/translate.vim',
        event = "VimEnter",
        config = function()
            require("rc.translate")
        end
    })
    use({'junegunn/vim-easy-align'})
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        event = "VimEnter",
        config = function()
            require("rc/gitsigns")
        end,
    })
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("rc.nvim-colorizer")
        end
    })
    use({
        'ntpeters/vim-better-whitespace',
        opt = true,
        cmd = {'StripWhitespace' },
        config = function()
            require("rc.vim-better-whitespace")
        end
    })
    use({
        "nvim-telescope/telescope.nvim",
        after = colorscheme ,
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require("rc.telescope-nvim")
        end,
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
