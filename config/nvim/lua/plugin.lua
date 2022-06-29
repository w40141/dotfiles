-- On ly required if you have packer in your `opt` pack

local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- TODO:
-- Plug 'romgrk/nvim-treesitter-context'
-- Plug 'folke/which-key.nvim'
-- Plug "mrjones2014/legendary.nvim"
-- Plug 'windwp/nvim-ts-autotag'
-- Plug 'MunifTanjim/nui.nvim'
-- Plug 'VonHeikemen/fine-cmdline.nvim'
-- Plug 'glidenote/memolist.vim'
-- Plug 'andymass/vim-matchup'
-- Plug 'klen/nvim-test'
-- fzf
-- https://github.com/nvim-telescope/telescope.nvim
-- Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
-- https://github.com/phaazon/hop.nvim
require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
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
    use("nvim-lua/plenary.nvim")
    use({
        'vim-jp/vimdoc-ja',
        opt = true,
        cmd = "help"
    })
    use({
        "goolord/alpha-nvim",
        require = { "kyazdani42/nvim-web-devicons" },
        config = function ()
            require("rc.alpha-nvim")
        end
    })
    use({
        "echasnovski/mini.nvim",
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
        "junegunn/goyo.vim",
        opt = true,
        cmd = "Goyo"
    })
    use({"famiu/bufdelete.nvim"})
    use({
        'vim-test/vim-test',
        config = function()
            require("rc.vim-test")
        end
    })
    use({
        "tamago324/lir.nvim",
        config = function()
            require("rc.lir")
        end
    })
    use({
        "terryma/vim-expand-region",
        setup = function()
            require("rc.vim-expand-region")
        end
        --{ 'on': '<Plug>(expand_region' }
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
        -- event = { "VimEnter", "ColorSchemePre" },
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
        setup = function()
            require("rc.winresizer")
        end
    })
    use({
        "numToStr/Comment.nvim",
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
    use({ 'itchyny/vim-cursorword'})
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
        config = function()
            require("rc/indent-blankline")
        end
    })
    use({
        'akinsho/toggleterm.nvim',
        event = "VimEnter",
        config = function()
            require("rc/toggleterm")
        end
    })
    use({'honza/vim-snippets'})
    -- use({ "rafamadriz/friendly-snippets", opt = true })
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
    use({'junegunn/fzf',})
    use({
        'neoclide/coc.nvim',
        branch =  'release',
        event = "VimEnter",
        run = ":CocUpdate",
        config = function()
            require("rc.coc")
        end
    })
    use({'kamykn/spelunker.vim'})
    use({'lambdalisue/gina.vim'})
    use({
        'liuchengxu/vista.vim',
        event = "VimEnter",
        config = function()
            require("rc.vista")
        end
    })
    use({
        'skanehira/translate.vim',
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
        'gelguy/wilder.nvim',
        run = ":UpdateRemotePlugins",
        config = function ()
            require("rc.wilder")
        end
    })
    if packer_bootstrap then
        require("packer").sync()
    end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerCompile
  augroup end
]])

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
end
