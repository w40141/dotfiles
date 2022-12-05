-- TODO: https://zenn.dev/kawarimidoll/articles/2e99432d27eda3
-- TODO: https://dev.classmethod.jp/articles/eetann-noice-nvim-beginner/

-- TODO: https://github.com/folke/noice.nvim
-- TODO: https://github.com/rcarriga/nvim-notify
-- TODO: https://github.com/jose-elias-alvarez/null-ls.nvim
-- TODO: https://github.com/kevinhwang91/nvim-bqf

local v = vim
local fn = v.fn
local cmd = v.cmd
local api = v.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd -- Create autocommand

local ensure_packer = function()
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
	-- Package Manager
	-- https://github.com/wbthomason/packer.nvim
	use({ "wbthomason/packer.nvim" })

	-- Library
	-- https://github.com/nvim-lua/plenary.nvim
	use({ "nvim-lua/plenary.nvim" })
	-- use({ "nvim-lua/popup.nvim", module = "popup" })
	-- use({ "kkharji/sqlite.lua", module = "sqlite" })
	use({ "MunifTanjim/nui.nvim", module = "nui" })
	-- https://github.com/vim-denops/denops.vim
	-- use({ "vim-denops/denops.vim" })

	-- Colorscheme
	-- https://github.com/rebelot/kanagawa.nvim
	use({
		"rebelot/kanagawa.nvim",
		config = function()
			require("rc.kanagawa-nvim")
		end,
	})

	-- Icons
	-- https://github.com/kyazdani42/nvim-web-devicons
	use({
		"kyazdani42/nvim-web-devicons",
	})

	-- Greeter
	-- https://github.com/goolord/alpha-nvim
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("rc.alpha-nvim")
		end,
	})

	-- https://github.com/folke/trouble.nvim
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		-- opt = true,
		event = "VimEnter",
		config = function()
			require("rc.trouble-nvim")
		end,
	})

	-- Fzf finder
	-- https://github.com/nvim-telescope/telescope.nvim
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		tag = "0.1.0",
		-- opt = true,
		after = { "trouble.nvim" },
		config = function()
			require("rc.telescope-nvim")
		end,
	})

	-- Treesitter configurations
	-- https://github.com/nvim-treesitter/nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "VimEnter",
		config = function()
			require("rc.nvim-treesitter")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		opt = true,
		after = { "nvim-treesitter" },
	})
	use({
		"yioneko/nvim-yati",
		opt = true,
		after = { "nvim-treesitter" },
	})
	use({
		"m-demare/hlargs.nvim",
		opt = true,
		after = { "nvim-treesitter" },
	})
	use({
		"p00f/nvim-ts-rainbow",
		opt = true,
		after = { "nvim-treesitter" },
	})
	use({
		"haringsrob/nvim_context_vt",
		opt = true,
		after = { "nvim-treesitter" },
	})

	-- Annotation generator
	-- https://github.com/danymat/neogen
	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		opt = true,
		after = { "nvim-treesitter" },
		config = function()
			require("rc/neogen")
		end,
	})

	-- Buffer line
	-- https://github.com/akinsho/bufferline.nvim
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("rc.bufferline-nvim")
		end,
	})

	-- Status line
	-- https://github.com/nvim-lualine/lualine.nvim
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("rc.lualine-nvim")
		end,
	})

	-- Adds vscode-like pictograms to neovim built-in lsp
	-- https://github.com/onsails/lspkind.nvim
	use({
		"onsails/lspkind-nvim",
		module = "lspkind",
		event = "InsertEnter",
		opt = true,
		config = function()
			require("rc.lspkind-nvim")
		end,
	})

	-- https://github.com/stevearc/aerial.nvim
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("rc.aerial-nvim")
		end,
	})

	-- Indent guide
	-- https://github.com/lukas-reineke/indent-blankline.nvim
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.indent-blankline-nvim")
		end,
	})

	-- quickly highlight <cword> or visually selected word
	-- https://github.com/t9md/vim-quickhl
	use({
		"t9md/vim-quickhl",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.vim-quickhl")
		end,
	})

	-- Highlight, list and search todo comments
	-- https://github.com/folke/todo-comments.nvim
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		opt = true,
		event = "VimEnter",
		config = function()
			require("rc.todo-comments-nvim")
		end,
	})

	-- Scrollbar
	-- https://github.com/petertriho/nvim-scrollbar
	use({
		"petertriho/nvim-scrollbar",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.nvim-scrollbar")
		end,
	})

	-- edit
	-- A surround text object plugin for neovim written in lua.
	-- https://github.com/ur4ltz/surround.nvim
	use({
		"ur4ltz/surround.nvim",
		event = { "VimEnter" },
		opt = true,
		config = function()
			require("rc.surround-nvim")
		end,
	})

	-- Snippet
	-- https://github.com/honza/vim-snippets
	use({
		"honza/vim-snippets",
		opt = true,
		event = "VimEnter",
	})

	-- Autopairs
	-- https://github.com/windwp/nvim-autopairs
	use({
		"windwp/nvim-autopairs",
		event = "VimEnter",
		opt = true,
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- https://github.com/dcampos/nvim-snippy
	use({
		"dcampos/nvim-snippy",
		opt = true,
		event = "VimEnter",
		config = function()
			require("rc.nvim-snippy")
		end,
	})

	-- LSP
	-- https://github.com/neovim/nvim-lspconfig
	use({
		"neovim/nvim-lspconfig",
		event = "VimEnter",
		config = function()
			require("rc.nvim-lspconfig")
		end,
	})
	-- https://github.com/williamboman/mason.nvim
	use({
		"williamboman/mason.nvim",
		event = "VimEnter",
		config = function()
			require("rc.mason")
		end,
	})
	-- https://github.com/williamboman/mason-lspconfig.nvim
	use({
		"williamboman/mason-lspconfig.nvim",
		after = { "mason.nvim", "nvim-lspconfig", "cmp-nvim-lsp" },
		config = function()
			require("rc.mason-lspconfig")
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
	-- https://github.com/hrsh7th/cmp-nvim-lsp
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
	-- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" })
	-- https://github.com/hrsh7th/cmp-buffer
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	-- https://github.com/hrsh7th/cmp-path
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	-- https://github.com/dcampos/cmp-snippy
	use({ "dcampos/cmp-snippy", after = { "nvim-cmp" } })
	-- https://github.com/ray-x/cmp-treesitter
	use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })
	-- https://github.com/yutkat/cmp-mocword
	use({ "yutkat/cmp-mocword", after = { "nvim-cmp" } })
	-- https://github.com/hrsh7th/cmp-cmdline
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	-- https://github.com/f3fora/cmp-spell
	use({ "f3fora/cmp-spell", after = "nvim-cmp" })

	-- engine SKK
	-- https://github.com/tyru/eskk.vim
	use({
		"tyru/eskk.vim",
		event = "InsertEnter",
		config = function()
			require("rc.eskk-vim")
		end,
	})

	-- A fancy, configurable, notification manager for NeoVim
	-- https://github.com/rcarriga/nvim-notify
	use({
		"rcarriga/nvim-notify",
		module = "notify",
		config = function()
			require("notify").setup({
				stages = "slide",
				background_colour = "FloatShadow",
				timeout = 3000,
			})
			v.notify = require("notify")
		end,
	})

	-- Use Neovim as a language server to inject LSP diagnostics, code actions
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "VimEnter",
		config = function()
			require("rc.null-ls-nvim")
		end,
	})

	use({
		"vim-jp/vimdoc-ja",
		opt = true,
		cmd = "help",
	})

	use({
		"airblade/vim-rooter",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.vim-rooter")
		end,
	})

	use({
		"tweekmonster/startuptime.vim",
		cmd = "StartupTime",
		opt = true,
	})

	use({
		"vim-test/vim-test",
		event = "CmdlineEnter",
		opt = true,
		config = function()
			require("rc.vim-test")
		end,
	})

	-- Generating images of source code using
	-- https://github.com/segeljakt/vim-silicon
	use({
		"segeljakt/vim-silicon",
		cmd = "Silicon",
		opt = true,
	})

	-- Automatically uppercase SQL keywords
	-- https://github.com/jsborjesson/vim-uppercase-sql
	use({
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
		opt = true,
	})

	-- Highlight length of search result
	-- https://github.com/kevinhwang91/nvim-hlslens
	use({
		"kevinhwang91/nvim-hlslens",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.nvim-hlslens")
		end,
	})

	-- Delete buffers
	-- https://github.com/famiu/bufdelete.nvim
	use({
		"famiu/bufdelete.nvim",
		event = "CmdlineEnter",
		opt = true,
	})

	-- File finder
	-- https://github.com/tamago324/lir.nvim
	use({
		"tamago324/lir.nvim",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		event = "VimEnter",
		-- opt = true,
		config = function()
			require("rc.lir-nvim")
		end,
	})

	-- Open URI
	-- https://github.com/tyru/open-browser.vim
	use({
		"tyru/open-browser.vim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.open-browser-vim")
		end,
	})

	use({
		"previm/previm",
		ft = { "markdown" },
		opt = true,
		config = function()
			require("rc.previm")
		end,
	})

	-- use({
	--   "rust-lang/rust.vim",
	--   ft = { "rust" },
	--   config = function()
	--     require("rc.rust-vim")
	--   end
	-- })
	-- use({
	--     "simrat39/rust-tools.nvim",
	--     ft = { "rust" },
	--     config = function()
	--         require("rc.rust-tools-nvim")
	--     end
	-- })

	-- Resizing of windows
	-- https://github.com/simeji/winresizer
	use({
		"simeji/winresizer",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.winresizer")
		end,
	})

	-- Comment out
	-- https://github.com/numToStr/Comment.nvim
	use({
		"numToStr/Comment.nvim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("Comment").setup()
		end,
	})

	-- Terminal
	-- https://github.com/akinsho/toggleterm.nvim
	use({
		"akinsho/toggleterm.nvim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.toggleterm-nvim")
		end,
	})

	-- https://github.com/TimUntersberger/neogit
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("neogit").setup({})
		end,
	})

	-- https://github.com/lambdalisue/gin.vim
	-- use({
	--   "lambdalisue/gin.vim",
	-- })

	use({
		"skanehira/translate.vim",
		event = "VimEnter",
		opt = true,
		config = function()
			require("rc.translate-vim")
		end,
	})

	-- https://github.com/lewis6991/gitsigns.nvim
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		-- event = "VimEnter",
		-- opt = true,
		config = function()
			require("rc.gitsigns-nvim")
		end,
	})

	-- Colorizer
	-- https://github.com/norcalli/nvim-colorizer.lua
	use({
		"norcalli/nvim-colorizer.lua",
		event = "VimEnter",
		config = function()
			require("rc.nvim-colorizer")
		end,
	})

	-- Whitespace highlighting
	-- https://github.com/ntpeters/vim-better-whitespace
	use({
		"ntpeters/vim-better-whitespace",
		cmd = { "StripWhitespace" },
		config = function()
			require("rc.vim-better-whitespace")
		end,
	})

	-- vim-asterisk written in lua
	-- https://github.com/rapan931/lasterisk.nvim
	use({
		"rapan931/lasterisk.nvim",
		event = "VimEnter",
		config = function()
			require("rc.lasterisk-nvim")
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

local puc = augroup("PackerUserConfig", {})
autocmd("BufWritePost", {
	pattern = "plugin.lua",
	group = puc,
	command = "source <afile> | PackerCompile",
})
