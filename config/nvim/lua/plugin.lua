-- TODO: https://github.com/kevinhwang91/nvim-bqf

local v = vim

local ensure_packer = function()
	local path = v.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if v.fn.empty(v.fn.glob(path)) > 0 then
		v.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			path,
		})
		v.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Package Manager
	-- https://github.com/wbthomason/packer.nvim
	use({ "wbthomason/packer.nvim" })

	-- Colorscheme
	use({
		-- https://github.com/rebelot/kanagawa.nvim
		"rebelot/kanagawa.nvim",
		config = require("rc.config.kanagawa"),
	})

	-- Greeter
	use({
		-- https://github.com/goolord/alpha-nvim
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		wants = { "nvim-web-devicons" },
		config = require("rc.config.alpha-nvim"),
	})

	-- Fzf finder
	use({
		-- https://github.com/nvim-telescope/telescope.nvim
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		module = { "telescope" },
		requires = {
			{
				-- https://github.com/folke/trouble.nvim
				"folke/trouble.nvim",
				cmd = { "Trouble" },
				module = { "trouble" },
				requires = {
					{
						"kyazdani42/nvim-web-devicons",
						module = { "nvim-web-devicons" },
					},
				},
				wants = { "nvim-web-devicons" },
				setup = require("rc.setup.trouble-nvim"),
				config = require("rc.config.trouble-nvim"),
			},
			{ "stevearc/aerial.nvim", module = { "aerial" } },
		},
		wants = { "trouble.nvim", "aerial.nvim" },
		setup = require("rc.setup.telescope-nvim"),
		config = require("rc.config.telescope-nvim"),
	})

	-- Treesitter configurations
	use({
		-- https://github.com/nvim-treesitter/nvim-treesitter
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile", "InsertEnter" },
		run = ":TSUpdate",
		config = require("rc.config.nvim-treesitter"),
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	})
	use({
		"yioneko/nvim-yati",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	})
	use({
		"m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	})
	use({
		"p00f/nvim-ts-rainbow",
		event = { "BufNewFile", "BufRead" },
		wants = { "nvim-treesitter" },
	})
	use({
		"haringsrob/nvim_context_vt",
		event = { "BufNewFile", "BufRead", "FocusLost", "CursorHold" },
		wants = { "nvim-treesitter" },
	})

	-- Annotation generator
	use({
		-- https://github.com/danymat/neogen
		"danymat/neogen",
		requires = { "nvim-treesitter/nvim-treesitter" },
		module = { "neogen" },
		wants = { "nvim-treesitter" },
		setup = require("rc.setup.neogen"),
		config = require("rc.config.neogen"),
	})

	use({
		-- https://github.com/stevearc/aerial.nvim
		"stevearc/aerial.nvim",
		module = { "aerial" },
		cmd = { "Aerial" },
		setup = require("rc.setup.aerial-nvim"),
		config = require("rc.config.aerial-nvim"),
	})

	-- Buffer line
	use({
		-- https://github.com/akinsho/bufferline.nvim
		"akinsho/bufferline.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
		},
		wants = { "nvim-web-devicons" },
		setup = require("rc.setup.bufferline-nvim"),
		config = require("rc.config.bufferline-nvim"),
	})

	-- Status line
	use({
		-- https://github.com/nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
			{ "rebelot/kanagawa.nvim" },
			{ "stevearc/aerial.nvim", module = { "aerial" } },
		},
		wants = { "nvim-web-devicons", "kanagawa.nvim", "aerial.nvim" },
		config = require("rc.config.lualine-nvim"),
	})

	-- Indent guide
	use({
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = require("rc.config.indent-blankline-nvim"),
	})

	-- quickly highlight <cword> or visually selected word
	use({
		-- https://github.com/t9md/vim-quickhl
		"t9md/vim-quickhl",
		keys = {
			{ "n", "<Plug>(quickhl-manual-this)" },
			{ "n", "<Plug>(quickhl-manual-reset)" },
		},
		setup = require("rc.setup.vim-quickhl"),
	})

	-- Highlight, list and search todo comments
	use({
		-- https://github.com/folke/todo-comments.nvim
		"folke/todo-comments.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		requires = { "nvim-lua/plenary.nvim" },
		wants = { "plenary.nvim" },
		setup = require("rc.setup.todo-comments-nvim"),
		config = require("rc.config.todo-comments-nvim"),
	})

	-- A surround text object plugin for neovim written in lua.
	use({
		-- https://github.com/ur4ltz/surround.nvim
		"ur4ltz/surround.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = require("rc.config.surround-nvim"),
	})

	-- LSP
	use({
		-- https://github.com/neovim/nvim-lspconfig
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre" },
		requires = {
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				event = { "FocusLost", "CursorHold" },
				config = require("rc.config.mason-tool-installer"),
			},
			{
				"neovim/nvim-lspconfig",
				module = { "lspconfig" },
				setup = require("rc.setup.nvim-lspconfig"),
				config = require("rc.config.nvim-lspconfig"),
			},
			{
				"williamboman/mason.nvim",
				module = { "mason" },
				config = require("rc.config.mason"),
			},
		},
		wants = {
			"mason.nvim",
			"nvim-lspconfig",
			"cmp-nvim-lsp",
		},
		config = require("rc.config.mason-lspconfig"),
	})

	use({
		-- https://github.com/hrsh7th/nvim-cmp
		"hrsh7th/nvim-cmp",
		module = { "cmp" },
		config = require("rc.config.nvim-cmp"),
		requires = {
			-- https://github.com/onsails/lspkind.nvim
			{ "onsails/lspkind-nvim", module = { "lspkind" } },
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp
				"hrsh7th/cmp-nvim-lsp",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
				"hrsh7th/cmp-nvim-lsp-signature-help",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-buffer
				"hrsh7th/cmp-buffer",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/ray-x/cmp-treesitter
				"ray-x/cmp-treesitter",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/yutkat/cmp-mocword
				"yutkat/cmp-mocword",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/f3fora/cmp-spell
				"f3fora/cmp-spell",
				event = { "InsertEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-cmdline
				"hrsh7th/cmp-cmdline",
				event = { "CmdlineEnter" },
			},
			{
				-- https://github.com/hrsh7th/cmp-path
				"hrsh7th/cmp-path",
				event = { "CmdlineEnter" },
			},
			{
				-- https://github.com/saadparwaiz1/cmp_luasnip
				"saadparwaiz1/cmp_luasnip",
				event = { "InsertEnter" },
				requires = {
					-- https://github.com/L3MON4D3/LuaSnip
					"L3MON4D3/LuaSnip",
					module = { "luasnip" },
					requires = { "honza/vim-snippets" },
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
	})

	use({
		-- https://github.com/windwp/nvim-autopairs
		"windwp/nvim-autopairs",
		module = { "nvim-autopairs" },
		requires = { "hrsh7th/nvim-cmp" },
		want = { "nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- engine SKK
	use({
		-- https://github.com/tyru/eskk.vim
		"tyru/eskk.vim",
		keys = {
			{ "n", "<Plug>(eskk:toggle)" },
			{ "c", "<Plug>(eskk:toggle)" },
		},
		setup = require("rc.setup.eskk"),
		config = require("rc.config.eskk"),
	})

	-- TODO: https://dev.classmethod.jp/articles/eetann-noice-nvim-beginner/
	-- A fancy, configurable, notification manager for NeoVim
	use({
		-- TODO: https://github.com/folke/noice.nvim
		"folke/noice.nvim",
		event = { "BufRead", "BufNewFile", "InsertEnter", "CmdlineEnter" },
		module = { "noice" },
		requires = {
			{ "MunifTanjim/nui.nvim" },
			{
				-- TODO: https://github.com/rcarriga/nvim-notify
				"rcarriga/nvim-notify",
				module = { "notify" },
				config = require("rc.config.nvim-notify"),
			},
		},
		wants = { "nvim-treesitter" },
		setup = require("rc.setup.noice-nvim"),
		config = require("rc.config.noice-nvim"),
	})

	-- TODO: https://zenn.dev/kawarimidoll/articles/2e99432d27eda3
	-- TODO: https://github.com/jose-elias-alvarez/null-ls.nvim
	-- Use Neovim as a language server to inject LSP diagnostics, code actions
	use({
		-- https://github.com/jose-elias-alvarez/null-ls.nvim
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = {
			"CursorHold",
			"FocusLost",
		},
		config = require("rc.config.null-ls-nvim"),
	})

	-- TODO:
	use({
		-- https://github.com/TimUntersberger/neogit
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", opt = true },
		wants = "plenary.nvim",
		cmd = { "Neogit" },
		config = function()
			require("neogit").setup({})
		end,
	})

	use({
		"vim-jp/vimdoc-ja",
		cmd = "help",
	})

	use({
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	})

	use({
		"vim-test/vim-test",
		event = "CmdlineEnter",
		setup = require("rc.setup.vim-test"),
		config = require("rc.config.vim-test"),
	})

	-- Generating images of source code using
	use({
		-- https://github.com/segeljakt/vim-silicon
		"segeljakt/vim-silicon",
		cmd = "Silicon",
	})

	-- Automatically uppercase SQL keywords
	use({
		-- https://github.com/jsborjesson/vim-uppercase-sql
		"jsborjesson/vim-uppercase-sql",
		ft = { "sql" },
	})

	-- Delete buffers
	use({
		-- https://github.com/famiu/bufdelete.nvim
		"famiu/bufdelete.nvim",
		event = "CmdlineEnter",
	})

	-- File finder
	use({
		-- https://github.com/tamago324/lir.nvim
		"tamago324/lir.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		module = { "lir.float" },
		requires = {
			{ "kyazdani42/nvim-web-devicons", module = { "nvim-web-devicons" } },
			{ "nvim-lua/plenary.nvim" },
		},
		wants = { "plenary.nvim", "nvim-web-devicons" },
		setup = require("rc.setup.lir-nvim"),
		config = require("rc.config.lir-nvim"),
	})

	-- Open URI
	use({
		-- https://github.com/tyru/open-browser.vim
		"tyru/open-browser.vim",
		keys = { "<plug>(openbrowser-smart-search)" },
		setup = require("rc.setup.open-browser"),
	})

	use({
		"previm/previm",
		ft = { "markdown" },
		config = require("rc.config.previm"),
	})

	-- use({
	-- 	"simrat39/rust-tools.nvim",
	-- 	module = { "rust-tools" },
	-- 	config = function()
	-- 		-- require("rc.rust-tools-nvim")
	-- 		require('rust-tools').setup()
	-- 	end
	-- })

	-- Resizing of windows
	use({
		-- https://github.com/simeji/winresizer
		"simeji/winresizer",
		keys = { { "n", "<C-e>" } },
		setup = require("rc.config.winresizer"),
	})

	-- Comment out
	use({
		-- https://github.com/numToStr/Comment.nvim
		"numToStr/Comment.nvim",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = function()
			require("Comment").setup()
		end,
	})

	-- Terminal
	use({
		-- https://github.com/akinsho/toggleterm.nvim
		"akinsho/toggleterm.nvim",
		keys = { "n", [[<c-;>]] },
		cmd = { "ToggleTerm", "ToggleTermAll", "TermExec" },
		config = require("rc.config.toggleterm-nvim"),
	})

	-- Scrollbar
	use({
		-- https://github.com/petertriho/nvim-scrollbar
		"petertriho/nvim-scrollbar",
		event = {
			"InsertEnter",
			"CursorHold",
			"FocusLost",
			"BufRead",
			"BufNewFile",
		},
		config = function()
			require("scrollbar").setup({})
		end,
	})

	use({
		-- https://github.com/lewis6991/gitsigns.nvim
		"lewis6991/gitsigns.nvim",
		event = { "FocusLost", "CursorHold" },
		config = require("rc.config.gitsigns-nvim"),
	})

	-- Colorizer
	use({
		-- https://github.com/norcalli/nvim-colorizer.lua
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup({})
		end,
	})

	-- Highlight length of search result
	use({
		-- https://github.com/kevinhwang91/nvim-hlslens
		"kevinhwang91/nvim-hlslens",
		keys = { { "n", "*" }, { "n", "g*" }, { "n", "g*" } },
		event = { "CmdlineEnter" },
		module = { "hlslens" },
		requires = {
			-- https://github.com/rapan931/lasterisk.nvim
			"rapan931/lasterisk.nvim",
			module = { "lasterisk" },
		},
		wants = { "lasterisk.nvim" },
		setup = require("rc.setup.nvim-hlslens"),
		config = function()
			require("hlslens").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
